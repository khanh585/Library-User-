import 'package:flutter/material.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Center(
            child: Text(
              'Location',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          width: MediaQuery.of(context).size.width / 3 - 40 / 3,
        ),
        SizedBox(
          child: Center(
            child: Text(
              'Bookshelf',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          width: MediaQuery.of(context).size.width / 3 - 40 / 3,
        ),
        SizedBox(
          child: Center(
            child: Text(
              'Drawer',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          width: MediaQuery.of(context).size.width / 3 - 40 / 3,
        ),
      ],
    );
  }
}
