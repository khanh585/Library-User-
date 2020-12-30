import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TotalFeedback extends StatefulWidget {
  final void Function() refresh;
  const TotalFeedback({
    Key key,
    this.refresh,
  }) : super(key: key);
  @override
  _TotalFeedbackState createState() => _TotalFeedbackState();
}

class _TotalFeedbackState extends State<TotalFeedback> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 30, top: 20, right: 30),
                    child: Text(
                      '4.8',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'RobotoMono'),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12.0),
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 40,
                    //itemPadding: EdgeInsets.symmetric(horizontal: 0.3),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    'Base on 922 Reviews',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'RobotoMono'),
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
