import 'package:flutter/material.dart';
import 'package:user_library/models/location.dart';

class LocationItem extends StatelessWidget {
  final Location location;

  const LocationItem({this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  "Location:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 70 - 40,
                child: Text(
                  this.location.locationName,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  "Shelf:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 70 - 40,
                child: Text(
                  this.location.bookShelfName,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  "Drawer:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 70 - 40,
                child: Text(
                  this.location.drawerName,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
