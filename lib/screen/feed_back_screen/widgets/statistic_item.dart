import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatisticItem extends StatefulWidget {
  final int numStar;
  final int total;
  final int numb;

  const StatisticItem({
    this.numStar,
    this.total,
    this.numb,
  });

  @override
  StatisticItemState createState() => StatisticItemState();
}

class StatisticItemState extends State<StatisticItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '${this.widget.numStar}',
                style: TextStyle(fontSize: 14),
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18.0,
              ),
            ],
          ),
          Container(
            child: LinearPercentIndicator(
              width: 120.0,
              lineHeight: 13.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                (this.widget.numb / this.widget.total * 100)
                        .toStringAsFixed(2) +
                    '%',
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
