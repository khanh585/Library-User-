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
              SizedBox(height: size.height * 0.03),
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
              ),
              RoundedInputField(
                hintText: "Name",
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
                  items: <String>['Male', 'Female']
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
                errorRegex:
                    r"/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/",
                errorMes: "Invalid",
              ),
              RoundedInputField(
                hintText: "Address",
                icon: Icons.home,
                controller: addressController,
              ),
              RoundedInputField(
                hintText: "DoB",
                icon: Icons.date_range,
                controller: dobController,
              ),
              RoundedInputField(
                hintText: "Username",
                icon: Icons.date_range,
                controller: usernameController,
              ),
              RoundedPasswordField(
                controller: passwordController,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  if (!this._formKey.currentState.validate()) {
                    return;
                  }

                  TmpUser user = new TmpUser(
                      address: addressController.text,
                      createdTime: DateTime.now().toString(),
                      deviceToken: "",
                      doB: dobController.text,
                      email: emailController.text,
                      gender: dropdownValue,
                      image: "",
                      name: nameController.text,
                      password: passwordController.text,
                      phone: phoneController.text,
                      roleId: 2,
                      username: usernameController.text);
                  CustomerDAO dao = new CustomerDAO();
                  dao.addCustomer(user);
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
            ],
          ),
        ),
      ),
    );
  }
}
