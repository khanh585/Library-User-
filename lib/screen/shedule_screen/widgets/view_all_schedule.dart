import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:user_library/models/schedule.dart';

import 'cart_item.dart';
class ViewAllSchedule extends StatefulWidget {
  final List schedules;
  const ViewAllSchedule({
    this.schedules,
  });
  @override
  _ViewAllScheduleState createState() => _ViewAllScheduleState();
}

class _ViewAllScheduleState extends State<ViewAllSchedule> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.widget.schedules == null
          ? null
          : SingleChildScrollView(
            child: Column(
              children: [
                for (Schedule dto in this.widget.schedules.reversed)
                  CartItem(
                    dto: dto,
                  ),
              ],
            ),
          )         
    );
  }
}