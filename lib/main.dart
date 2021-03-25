import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/book_detail_screen/book_detail_screen.dart';
import 'package:user_library/screen/feed_back_screen/feedback_screen.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_screen.dart';
import 'package:user_library/screen/librarian_home_screen/librarian_home_screen.dart';
import 'package:user_library/screen/login_screen/login_screen.dart';
import 'package:user_library/screen/login_screen_2/widgets/background.dart';
import 'package:user_library/screen/main_layout/main_layout.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_screen.dart';
import 'package:user_library/screen/welcome_screen/welcome_screen.dart';
import 'package:user_library/screen/wishlist_screen_2/wishlist_screen_2.dart';
import 'package:user_library/service/Authenticate.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'screen/librarian_home_screen/librarian_home_screen.dart';
import 'widgets/security_layout/authenticate_bloc.dart';
import 'widgets/security_layout/authenticate_event.dart';
import 'widgets/security_layout/authenticate_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // final AuthenticateBloc authenticateBloc = new AuthenticateBloc();
  bool hasToken = false;
  bool isChecked = false;

  TmpUser user = null;
  @override
  void initState() {
    _checkToken();
    super.initState();
  }

  _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('PAPV_Token') ?? '');
    if (token != '') {
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      TmpUser tmpUser = TmpUser.fromJson(payload);
      setState(() {
        hasToken = true;
        user = tmpUser;
      });
    }
    setState(() {
      isChecked = true;
    });
  }

  Widget Home() {
    if (this.user != null) {
      if (this.user.roleId == 2) {
        return MainLayout(user: this.user);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => MainLayout(user: this.user)),
        // );
      } else if (this.user.roleId == 3) {
        return LibrarianHomeScreen(user: this.user);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => LibrarianHomeScreen(user: this.user)),
        // );
      }
    } else {
      return WelcomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isChecked
          ? Container(child: Home())
          : Container(
              color: Colors.white,
              child: Image.asset(
                "images/chat.png",
                fit: BoxFit.contain,
              ),
            ),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }

  Future<void> handelLogin() async {}
}
