import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/dao/TokenDAO.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/login_screen/widgets/rounded_button.dart';
import 'package:user_library/widgets/login/rounded_input_field.dart';
import 'package:user_library/widgets/login/rounded_password_field.dart';
import 'package:user_library/widgets/login/text_field_container.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Body extends StatefulWidget {
  final TmpUser user;
  final Function refresh;

  const Body({this.user, this.refresh});
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  String dropdownValue = 'Male';
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isWait = false;
  DateTime _date = DateTime.now();

  void initState() {
    super.initState();

    nameController.text = this.widget.user.name;
    phoneController.text = this.widget.user.phone;
    addressController.text = this.widget.user.address;
    dobController.text = this.widget.user.doB.substring(0, 10);

    dropdownValue = this.widget.user.gender;
    _viewPass();
  }

  Future<void> _viewPass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    passwordController.text = prefs.getString('PAPV_Password');
    print(prefs.getString('PAPV_Password'));
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2021 - 30),
        lastDate: DateTime(2022),
        builder: (BuildContext context, Widget child) {
          return Theme(
              child: child,
              data: ThemeData(
                primaryColor: Colors.orange,
                primarySwatch: Colors.orange,
                accentColor: Colors.orange,
              ));
        });

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        dobController.text = _datePicker.toString().split(" ")[0];
        _date = _datePicker;
      });
    }
  }

  Future<TmpUser> _getToken(username, password) async {
    TokenDAO dao = new TokenDAO();
    TmpUser user = await dao.loginWithJWT(username, password);
    return user;
  }

  Future<void> _updatePatron() async {
    setState(() {
      isWait = true;
    });

    if (!this._formKey.currentState.validate()) {
      setState(() {
        isWait = false;
      });
      return;
    }

    String avatar = "";
    if (dropdownValue == "Male") {
      avatar =
          "https://firebasestorage.googleapis.com/v0/b/capstone-96378.appspot.com/o/avatar%2F3.png?alt=media&token=488ba33c-cd4e-44f0-8652-db973cf54b18";
    } else if (dropdownValue == "Female") {
      avatar =
          "https://firebasestorage.googleapis.com/v0/b/capstone-96378.appspot.com/o/avatar%2F4.png?alt=media&token=d06bddbe-3151-4d88-a85b-6144d811b77a";
    } else {
      avatar =
          "https://firebasestorage.googleapis.com/v0/b/capstone-96378.appspot.com/o/avatar%2F1.png?alt=media&token=a2d4166a-f7c4-4c61-88f7-7683f284e886";
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    TmpUser user = new TmpUser(
      id: prefs.getString('PAPV_UserID'),
      username: this.widget.user.username,
      email: this.widget.user.email,
      address: addressController.text,
      createdTime: DateTime.now().toString(),
      deviceToken: "",
      doB: dobController.text,
      gender: dropdownValue,
      image: avatar,
      name: nameController.text,
      password: passwordController.text,
      phone: phoneController.text,
      roleId: 2,
    );

    user.deviceToken = await FirebaseMessaging().getToken();
    CustomerDAO dao = new CustomerDAO();
    dao.updateUser(user.id, user).then((value) {
      _getToken(user.username, passwordController.text);

      if (value == 'success') {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Success',
            desc: 'Updated!',
            btnOkOnPress: () {
              setState(() {
                isWait = false;
              });
              this.widget.refresh();
            },
            btnOkColor: Colors.green)
          ..show();
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Fail',
            desc: 'Update fail!',
            btnOkOnPress: () {
              setState(() {
                isWait = false;
              });
            },
            btnOkColor: Colors.red)
          ..show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: this._formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              Container(
                width: 90,
                height: 90,
                margin: EdgeInsets.only(bottom: 15),
                child: CircleAvatar(
                  radius: 90.0,
                  backgroundImage: NetworkImage(
                    "${this.widget.user.image}",
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
              RoundedInputField(
                hintText: "Name",
                maxLength: 100,
                controller: nameController,
              ),
              TextFieldContainer(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  isExpanded: true,
                  iconSize: 24,
                  elevation: 36,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              RoundedInputField(
                hintText: "Phone",
                icon: Icons.phone,
                controller: phoneController,
                errorRegex: r"(84|0[3|5|7|8|9])+([0-9]{8})\b",
                errorMes: "Invalid",
              ),
              RoundedInputField(
                hintText: "Address",
                icon: Icons.home,
                controller: addressController,
              ),
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    RoundedInputField(
                      hintText: "DoB: dd/mm/yyyy",
                      icon: Icons.date_range,
                      controller: dobController,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        color: Colors.white.withOpacity(0),
                        height: 65,
                        width: MediaQuery.of(context).size.width - 60,
                      ),
                    )
                  ],
                ),
              ),
              RoundedPasswordField(
                controller: passwordController,
              ),
              isWait
                  ? Image.asset(
                      "images/loading1.gif",
                      height: 80.0,
                      width: 250.0,
                    )
                  : RoundedButton(
                      text: "UPDATE",
                      press: () {
                        _updatePatron();
                      },
                    ),
              SizedBox(height: size.height * 0.5),
            ],
          ),
        ),
      ),
    );
  }
}
