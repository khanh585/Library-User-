import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:user_library/models/feedback.dart';

import 'feedback_item.dart';

class FeebackList extends StatefulWidget {
  final void Function() refresh;
  final List<Feedback> listData;
  const FeebackList({
    this.refresh,
    this.listData,
  });
  @override
  FeebackListState createState() => FeebackListState();
}

class FeebackListState extends State<FeebackList> {
  @override
  void initState() {
    // list = this.widget.listData;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          for (Feedback feedback in this.widget.listData.reversed)
            FeedbackItem(
              feedback: feedback,
            ),
        ],
      ),
    );
  }
}
