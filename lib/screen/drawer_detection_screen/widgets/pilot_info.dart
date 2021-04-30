import 'package:flutter/material.dart';

class Pilot_info extends StatelessWidget {
  final String name;
  final String avatar;
  final String bookshelf;
  const Pilot_info({this.name, this.avatar, this.bookshelf});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          this.avatar == ''
              ? Image.asset(
                  "images/dp.png",
                )
              : Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: CircleAvatar(
                    radius: 90.0,
                    backgroundImage: NetworkImage(
                      "${this.avatar}",
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 45,
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      'Staff:  ',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 8 * 5,
                    child: Text(
                      this.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 45,
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      'Shelf:  ',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 8 * 5,
                    child: Text(
                      this.bookshelf,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}