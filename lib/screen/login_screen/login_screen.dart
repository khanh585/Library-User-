import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/screen/login_screen/login_screen_bloc.dart';
import 'package:user_library/widgets/animation/fade_side_out.dart';

import 'widgets/login_background.dart';

class LoginScreen extends StatefulWidget {
  final Future<void> Function() handelLogin;

  LoginScreen({this.handelLogin});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  bool _visible;
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  LoginBloc loginBloc = LoginBloc();
  @override
  void initState() {
    _visible = false;
    Future.delayed(
        Duration(milliseconds: 300),
        () => setState(() {
              _visible = !_visible;
            }));
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1, 0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Login_Background(
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: SlideTransition(
          position: _offsetAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 250,
                ),
                Icon(
                  Icons.credit_card,
                  size: 100,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PAPV',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      ' Library',
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _visible = false;
                            });
                            _controller.forward();
                          },
                          child: Container(
                            width: 240,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      FlatButton(
                          child: Container(
                        width: 240,
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromRGBO(78, 105, 218, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
