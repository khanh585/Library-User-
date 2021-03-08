import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'statistic_item.dart';

class StatisticFeedback extends StatefulWidget {
  final void Function() refresh;
  final int total;
  final double rating;
  final List countRating;

  StatisticFeedback({this.refresh, this.total, this.rating, this.countRating});
  @override
  StatisticFeedbackState createState() => StatisticFeedbackState();
}

class StatisticFeedbackState extends State<StatisticFeedback> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.countRating);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            widget.rating.toStringAsFixed(2),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'RobotoMono'),
                          ),
                        ),
                        RatingBar.builder(
                          initialRating:
                              num.parse(widget.rating.toStringAsFixed(1)),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          ignoreGestures: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, top: 5),
                          child: Text(
                            '${this.widget.total}',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'RobotoMono'),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var star in widget.countRating)
                        StatisticItem(
                          numStar: star['rating'],
                          numb: star["count"],
                          total: widget.total,
                        ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
