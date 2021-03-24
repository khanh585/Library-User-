import 'package:flutter/material.dart';

import 'package:user_library/models/book.dart';
import 'package:user_library/models/user_feedback.dart';
import 'package:user_library/screen/feed_back_screen/feedback_screen_event.dart';
import 'package:user_library/screen/feed_back_screen/feedback_screen_state.dart';
import 'package:user_library/widgets/app_bar_custom.dart';
import 'package:user_library/screen/feed_back_screen/widgets/text_field_feedback.dart';
import 'package:user_library/screen/feed_back_screen/widgets/feedback_list.dart';
import 'package:user_library/widgets/loading_circle.dart';

import 'feedback_screen_bloc.dart';

class FeedbackScreen extends StatefulWidget {
  final Book book;
  FeedbackScreen({this.book});
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final feedbackScreenBloc = FeedbackScreenBloc();

  int sorted = -1;
  @override
  void initState() {
    feedbackScreenBloc.eventController.sink
        .add(FetchFeedback(bookId: 1, page: 1, pageSize: 10));
  }

  void refreshRating() {
    // print(123123);
    // FeedbackScreenBloc.eventController.sink
    //     .add(FetchFeedbackEvent(bookGroupID: 1, rating: -1));
  }

  void sendFeedback(UserFeedback dto) {
    print(dto.customerId);
    feedbackScreenBloc.eventController.sink.add(SentFeedbackEvent(userFeedback: dto));
  }

  void sortBy(int sorted) {
    //feedback_bloc.eventController.sink.add(SortedFeedbackEvent(sorted));

    setState(() {
      this.sorted = sorted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: StreamBuilder<FeedbackScreenState>(
                stream: feedbackScreenBloc.stateController.stream,
                initialData: feedbackScreenBloc.state,
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text("Error");
                  if (snapshot.data.listFeedback != null &&
                      snapshot.data.rating.length != 0) {
                    return Container(
                        padding: EdgeInsets.only(bottom: 70),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Divider(
                              color: Colors.black,
                              height: 30,
                              indent: 20,
                              endIndent: 20,
                              thickness: 1,
                            ),
                            FeebackList(
                              listData: snapshot.data.listFeedback,
                            ),
                          ],
                        ));
                  } else
                    return LoadingCircle(50, Colors.purple[400]);
                }),
          ),
        ],
      ),
      floatingActionButton: TextFieldFeedback(
        bookGroupID: 1,
        onSendMessage: sendFeedback,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
