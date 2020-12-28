import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ViewAllFeedback extends StatefulWidget {
  final void Function() refresh;
  const ViewAllFeedback({
    Key key,
    this.refresh,
  }) : super(key: key);
  @override
  _ViewAllFeedbackState createState() => _ViewAllFeedbackState();
}

class _ViewAllFeedbackState extends State<ViewAllFeedback> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5.0),
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
                backgroundColor: Colors.transparent,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kita Chihoko',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RobotoMono'),
                  ),
                  Text(
                    'October 14, 2018',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RobotoMono'),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 60.0),
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 22,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 60.0),
              ),
              Flexible(
                  child: Container(
                child: Text(
                  'I visit the park on 9/10, I stayed at the Universal Sheraton, so I got early entrance into the park which I took advantage',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'RobotoMono'),
                ),
              )),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 50,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5.0),
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/originals/c8/5f/88/c85f8819972c7002ca2ff48b9cae3cf9.jpg"),
                backgroundColor: Colors.transparent,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kita Chihoko',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RobotoMono'),
                  ),
                  Text(
                    'October 14, 2018',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RobotoMono'),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 60.0),
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 22,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 60.0),
              ),
              Flexible(
                  child: Container(
                child: Text(
                  'I visit the park on 9/10, I stayed at the Universal Sheraton, so I got early entrance into the park which I took advantage',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'RobotoMono'),
                ),
              )),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 50,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5.0),
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/originals/24/1b/19/241b19d0d0f20089797ea27efe5cb18e.jpg"),
                backgroundColor: Colors.transparent,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kita Chihoko',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RobotoMono'),
                  ),
                  Text(
                    'October 14, 2018',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RobotoMono'),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 60.0),
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 22,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 60.0),
              ),
              Flexible(
                child: Container(
                child: Text(
                  'I visit the park on 9/10, I stayed at the Universal Sheraton, so I got early entrance into the park which I took advantage',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'RobotoMono'),
                ),
              )),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 50,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
