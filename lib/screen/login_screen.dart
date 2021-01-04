import 'package:flutter/material.dart';
import 'package:user_library/widget/login/login_body.dart';

class Login_Screen extends StatefulWidget {
  Login_Screen({Key key}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Login_Body(),
    );
  }
}
