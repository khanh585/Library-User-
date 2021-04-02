import 'package:flutter/material.dart';

class DrawerDetectionDetail extends StatefulWidget {
  const DrawerDetectionDetail({
    Key key,
  }) : super(key: key);

  @override
  _DrawerDetectionDetailState createState() => _DrawerDetectionDetailState();
}

class _DrawerDetectionDetailState extends State<DrawerDetectionDetail> {
  @override
  Widget build(BuildContext context){
      return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest Orders",
                  style: TextStyle(
                    color: Color.fromRGBO(19, 22, 33, 1),
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Color.fromRGBO(86, 215, 188, 1),
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),     // Let's create an order model
        ],
      ),
    );
  }
}