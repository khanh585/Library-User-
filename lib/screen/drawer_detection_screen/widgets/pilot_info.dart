import 'package:flutter/material.dart';

class Pilot_info extends StatelessWidget {
  final String name;
  final String avatar;
  const Pilot_info({this.name, this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          this.avatar == ''
              ? Image.asset(
                  "images/dp.png",
                )
              : Image.network(this.avatar),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilot',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Text(
                this.name,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
