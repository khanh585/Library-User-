import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/login_screen/widgets/rounded_button.dart';
import 'package:user_library/screen/login_screen_2/login_screen.dart';
import 'package:user_library/screen/signup_screen/widgets/background.dart';
import 'package:user_library/widgets/login/already_have_an_account_acheck.dart';
import 'package:user_library/widgets/login/rounded_input_field.dart';
import 'package:user_library/widgets/login/rounded_password_field.dart';
import 'package:user_library/widgets/login/text_field_container.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  String dropdownValue = 'Male';
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool emailDup = false;
  bool usernameDup = false;
  bool isWait = false;
  DateTime _date = DateTime.now();

  void _checkDuplicate() async {
    String username = usernameController.text;
    String email = emailController.text;
    await CustomerDAO().fetchCustomerByName(username.trim()).then((value) {
      setState(() {
        usernameDup = value.isNotEmpty;
      });
    });
    await CustomerDAO().fetchCustomerByEmail(email.trim()).then((value) {
      setState(() {
        emailDup = value.isNotEmpty;
      });
    });
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

  void _creatPatron() {
    setState(() {
      isWait = true;
    });
    _checkDuplicate();

    if (!this._formKey.currentState.validate()) {
      setState(() {
        isWait = false;
      });
      return;
    }
    if (emailDup || usernameDup) {
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
    var bytes = utf8.encode(passwordController.text); // data being hashed
    var digest = sha1.convert(bytes);
    TmpUser user = new TmpUser(
        address: addressController.text,
        createdTime: DateTime.now().toString(),
        deviceToken: "",
        doB: dobController.text,
        email: emailController.text,
        gender: dropdownValue,
        image: avatar,
        name: nameController.text,
        password: digest.toString(),
        phone: phoneController.text,
        roleId: 2,
        username: usernameController.text);
    user.deviceToken = '';

    CustomerDAO dao = new CustomerDAO();
    dao.addCustomer(user).then((value) {
      if (value != null) {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Success',
            desc: 'Sign up success!\n Login now!',
            btnOkOnPress: () {
              setState(() {
                isWait = false;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              });
            },
            btnOkColor: Colors.green)
          ..show();
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Fail',
            desc: 'Sign up Fail!',
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
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: this._formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "images/signup.svg",
                height: size.height * 0.15,
              ),
              RoundedInputField(
                hintText: "Email",
                controller: emailController,
                errorRegex:
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                errorMes: "Invalid",
                isDup: emailDup,
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
              RoundedInputField(
                hintText: "Username",
                maxLength: 20,
                minLength: 8,
                icon: Icons.date_range,
                controller: usernameController,
                isDup: usernameDup,
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
                      text: "SIGNUP",
                      press: () {
                        _creatPatron();
                      },
                    ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.4),
            ],
          ),
        ),
      ),
    );
  }
}
