import 'package:flutter/material.dart';

class Login_Background extends StatelessWidget {
  final Widget child;
  const Login_Background({
    this.child,
  });

  // final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              const Color.fromRGBO(78, 105, 218, 1),
              const Color.fromRGBO(171, 106, 182, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp),
      ),
      child: child,
    );
  }
}
