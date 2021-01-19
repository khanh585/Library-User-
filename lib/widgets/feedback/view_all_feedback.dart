import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:user_library/dto/FeedbackDTO.dart';

class ViewAllFeedback extends StatefulWidget {
  final void Function() refresh;
  final List listData;
  const ViewAllFeedback({
    Key key,
    this.refresh,
    this.listData,
  }) : super(key: key);
  @override
  _ViewAllFeedbackState createState() => _ViewAllFeedbackState();
}

class _ViewAllFeedbackState extends State<ViewAllFeedback> {
  @override
  void initState() {
    // list = this.widget.listData;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: this.widget.listData == null
          ? null
          : Column(
              children: [
                for (FeedbackDTO dto in this.widget.listData.reversed)
                  ItemFeedback(
                    dto: dto,
                  ),
              ],
            ),
    );
  }
}

class ItemFeedback extends StatelessWidget {
  final FeedbackDTO dto;
  const ItemFeedback({
    Key key,
    this.dto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('images/avatar.jpg'),
                    backgroundColor: Colors.transparent,
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
                ],
              ),
              RatingBar.builder(
                ignoreGestures: true,
                initialRating: this.dto.rating.toDouble(),
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
            width: MediaQuery.of(context).size.width - 60,
            margin: EdgeInsets.only(left: 60),
            child: Text(
              this.dto.content,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'RobotoMono'),
            ),
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
