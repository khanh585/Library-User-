import 'package:flutter/material.dart';
import 'package:user_library/widget/app_bar_custom.dart';
import 'package:user_library/widget/feedback/add_review.dart';
import 'package:user_library/widget/feedback/total_feedback.dart';
import 'package:user_library/widget/feedback/view_all_feedback.dart';

class Feedback_Screen extends StatefulWidget {
  Feedback_Screen({Key key}) : super(key: key);

  @override
  _Feedback_ScreenState createState() => _Feedback_ScreenState();
}

class _Feedback_ScreenState extends State<Feedback_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: [
            AppBarCustom(
              title: Text(
                "Feedbacks Book",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                    fontFamily: 'RobotoMono'),
              ),
            ),
            AddReview(),
            TotalFeedback(),
            Divider(
              color: Colors.black,
              height: 50,
              indent: 20,
              endIndent: 20,
              thickness: 2,
            ),
            ViewAllFeedback()
          ],
        ),
      ),
    );
  }
}
