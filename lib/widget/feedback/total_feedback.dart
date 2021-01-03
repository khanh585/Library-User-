import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:user_library/dto/FeedbackDTO.dart';

class TotalFeedback extends StatefulWidget {
  final void Function() refresh;
  final int total;
  final Map<int, List<FeedbackDTO>> feedbacks;

  const TotalFeedback({
    Key key,
    this.refresh,
    this.total,
    this.feedbacks,
  }) : super(key: key);
  @override
  _TotalFeedbackState createState() => _TotalFeedbackState();
}

class _TotalFeedbackState extends State<TotalFeedback> {
  List stars = [5, 4, 3, 2, 1];
  double rating = 0;

  Widget refreshRate() {
    rating = 0;
    stars.forEach((element) {
      if (this.widget.feedbacks[element] != null) {
        rating += this.widget.feedbacks[element].length * element;
        print(rating);
      }
    });
    setState(() {
      rating = double.parse((rating / this.widget.total).toStringAsFixed(2));
    });
    return SizedBox(
      height: 1,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this.widget.feedbacks.forEach((key, value) {});
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
        padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
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
        child: this.widget.feedbacks.isEmpty
            ? null
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  refreshRate(),
                  Text('Rating',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 28,
                          fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, right: 50),
                            child: Text(
                              this.rating.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'RobotoMono'),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 20,
                            //itemPadding: EdgeInsets.symmetric(horizontal: 0.3),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, top: 5),
                            child: Text(
                              '${this.widget.total}',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'RobotoMono'),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int star in stars)
                            RateItem(
                              numStar: star,
                              numb: this.widget.feedbacks[star] == null
                                  ? 0.0
                                  : this
                                      .widget
                                      .feedbacks[star]
                                      .length
                                      .toDouble(),
                              total: this.widget.total.toDouble(),
                            ),
                        ],
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}

class RateItem extends StatefulWidget {
  const RateItem({
    Key key,
    this.numStar,
    this.total,
    this.numb,
  }) : super(key: key);
  final int numStar;
  final double total;
  final double numb;

  @override
  _RateItemState createState() => _RateItemState();
}

class _RateItemState extends State<RateItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${this.widget.numStar}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            child: LinearPercentIndicator(
              width: 150.0,
              lineHeight: 13.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                (this.widget.numb / this.widget.total * 100).toString() + '%',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              percent: this.widget.numb / this.widget.total,
              progressColor: Colors.purple.shade300,
            ),
          )
        ],
      ),
    );
  }
}
