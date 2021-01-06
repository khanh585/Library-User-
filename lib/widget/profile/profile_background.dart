import 'package:flutter/material.dart';

class Profile_Background extends StatelessWidget {
  final Widget child;
  const Profile_Background({
    Key key,
    // @required this.size,
    this.child,
  }) : super(key: key);

  // final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'images/main_top.png',
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'images/main_bottom.png',
              width: size.width * 0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
