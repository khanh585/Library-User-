import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:user_library/constants.dart';
import 'package:user_library/screen/home_screen.dart';
import 'package:user_library/screen/search_book_screen.dart';
import 'package:user_library/widget/login/login_background.dart';
import 'package:user_library/widget/login/rounded_button.dart';

class Login_Body extends StatefulWidget {
  Login_Body({Key key}) : super(key: key);

  @override
  _Login_Body_State createState() => _Login_Body_State();
}

class _Login_Body_State extends State<Login_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Login_Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'PAPV',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: size.height * 0.08),
            SvgPicture.asset(
              'icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: 'SIGN IN WITH GOOGLE',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home_Screen();
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
