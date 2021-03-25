import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_library/dao/TokenDAO.dart';
import 'package:user_library/screen/librarian_home_screen/librarian_home_screen.dart';
import 'package:user_library/screen/login_screen_2/widgets/background.dart';
import 'package:user_library/screen/main_layout/main_layout.dart';
import 'package:user_library/screen/signup_screen/signup_screen.dart';
import 'package:user_library/widgets/loading_circle.dart';
import 'package:user_library/widgets/login/already_have_an_account_acheck.dart';
import 'package:user_library/widgets/login/rounded_button.dart';
import 'package:user_library/widgets/login/rounded_input_field.dart';
import 'package:user_library/widgets/login/rounded_password_field.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String username;
  String password;
  bool isLoading = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "images/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Username",
              controller: usernameController,
            ),
            RoundedPasswordField(
              controller: passwordController,
            ),
            !isLoading
                ? RoundedButton(
                    text: "LOGIN",
                    press: () async {
                      setState(() {
                        isLoading = true;
                      });
                      username = usernameController.text;
                      password = passwordController.text;
                      TokenDAO dao = new TokenDAO();
                      String role;
                      var value = await dao.loginWithJWT(username, password);
                      if (value != null) {
                        if (value.roleId.toString() == "2") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainLayout(user: value)),
                          );
                        } else if (value.roleId.toString() == "3") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LibrarianHomeScreen(user: value)),
                          );
                        }
                      } else if (value == null) {
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Error',
                            desc: 'Wrong username or password!!!',
                            btnOkOnPress: () {
                              setState(() {
                                isLoading = false;
                              });
                            },
                            btnOkColor: Colors.red)
                          ..show();
                      }
                      isLoading = false;
                    },
                  )
                : LoadingCircle(30, Colors.black),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
