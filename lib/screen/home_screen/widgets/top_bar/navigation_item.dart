import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final String text;
  final IconData icon;
  NavigationItem({
    this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: null,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.orange,
              size: 25,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
