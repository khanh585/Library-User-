import 'package:flutter/material.dart';
import 'package:user_library/bloc/Feedback_bloc.dart';
import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/event/Feedback_event.dart';
import 'package:user_library/state/Feedback_state.dart';
import 'package:user_library/widget/app_bar_custom.dart';
import 'package:user_library/widget/feedback/BookInfo.dart';
import 'package:user_library/widget/feedback/text_field_feedback.dart';
import 'package:user_library/widget/feedback/total_feedback.dart';
import 'package:user_library/widget/feedback/view_all_feedback.dart';

class Feedback_Screen extends StatefulWidget {
  Feedback_Screen({Key key}) : super(key: key);

  @override
  _Feedback_ScreenState createState() => _Feedback_ScreenState();
}

class _Feedback_ScreenState extends State<Feedback_Screen> {
  final feedback_bloc = FeedbackBloc();
  @override
  void initState() {
    refreshRating();
    super.initState();
  }

  void refreshRating() {
    feedback_bloc.eventController.sink.add(FetchFeedbackEvent(1, -1));
  }

  void sendFeedback(FeedbackDTO dto) {
    feedback_bloc.eventController.sink.add(SentFeedbackEvent(dto));
  }

  @override
  Widget build(BuildContext context) {
    // double he = MediaQuery.of(context).size.height;
    // double wi = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: StreamBuilder<FeedbackState>(
            stream: feedback_bloc.stateController.stream,
            initialData: feedback_bloc.state,
            builder: (context, snapshot) {
              return Column(
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
                  BookInfo(),
                  TotalFeedback(
                    refresh: refreshRating,
                    total: snapshot.data.total,
                    feedbacks: snapshot.data.typeFeedbacks,
                  ),
                  Divider(
                    color: Colors.black,
                    height: 50,
                    indent: 20,
                    endIndent: 20,
                    thickness: 2,
                  ),
                  ViewAllFeedback()
                ],
              );
            }),
      ),
      floatingActionButton: SizedBox(
        child: Container(
          child: TextFieldFeedback(
            bookGroupID: 1,
            onSendMessage: sendFeedback,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
