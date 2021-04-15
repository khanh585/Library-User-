import 'package:flutter/material.dart';

class RowLocation extends StatefulWidget {
  final String location;
  final String shelf;
  final String drawer;

  const RowLocation({
    this.location,
    this.shelf,
    this.drawer,
  });

  @override
  _RowLocationState createState() => _RowLocationState();
}

class _RowLocationState extends State<RowLocation> {
  final double size = 16;
  bool isPick = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPick = !isPick;
        });
      },
      child: Container(
        color: isPick ? Color(0xFF9966).withOpacity(0.95) : Colors.transparent,
        height: 38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Center(
                      child: Text(
                    this.widget.location,
                    style: TextStyle(fontSize: size),
                  )),
                  width: MediaQuery.of(context).size.width / 3 - 40 / 3,
                ),
                SizedBox(
                  child: Center(
                      child: Text(
                    this.widget.shelf,
                    style: TextStyle(fontSize: size),
                  )),
                  width: MediaQuery.of(context).size.width / 3 - 40 / 3,
                ),
                SizedBox(
                  child: Center(
                      child: Text(
                    this.widget.drawer,
                    style: TextStyle(fontSize: size),
                  )),
                  width: MediaQuery.of(context).size.width / 3 - 40 / 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
