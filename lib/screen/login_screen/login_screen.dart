import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_library/screen/login_screen/login_screen_bloc.dart';
import 'package:user_library/screen/login_screen/login_screen_event.dart';
import 'package:user_library/screen/login_screen/login_screen_state.dart';
import 'package:user_library/widgets/loading_circle.dart';
import 'package:user_library/widgets/login/login_background.dart';

import '../../constants.dart';

class Login_Screen extends StatefulWidget {
  final Future<void> Function() handelLogin;

  Login_Screen({this.handelLogin});

  @override
  _Login_Screen_State createState() => _Login_Screen_State();
}

class _Login_Screen_State extends State<Login_Screen> {
  LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Login_Background(
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
            StreamBuilder<LoginScreenState>(
                stream: loginBloc.stateController.stream,
                initialData: loginBloc.state,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    bool loading = snapshot.data.isLoading;

                    return GestureDetector(
                        onTap: () async {
                          loginBloc.eventController.sink.add(LoginLoading());
                          await widget.handelLogin().whenComplete(() {
                            loginBloc.eventController.sink.add(FinishProcess());
                          });
                        },
                        child: AnimatedContainer(
                          width: loading ? 100 : 250,
                          height: 50,
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                              color: Color(0xff7B35BA),
                              borderRadius: BorderRadius.circular(12)),
                          child: loading
                              ? LoadingCircle(20, Colors.white)
                              : OverflowBox(
                                  minWidth: 50,
                                  maxWidth: 200,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'images/google-login.png',
                                        width: 30,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "SIGN IN WITH GOOGLE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      )
                                    ],
                                  )),
                        ));
                  }
                })
          ],
        ),
      ),
    ));
  }
}
