import 'package:flutter/material.dart';

import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/feed_back_screen/feedback_screen_event.dart';
import 'package:user_library/screen/feed_back_screen/feedback_screen_state.dart';
import 'package:user_library/widgets/app_bar_custom.dart';
import 'package:user_library/widgets/feedback/BookInfo.dart';
import 'package:user_library/screen/feed_back_screen/widgets/popupFeedback.dart';
import 'package:user_library/screen/feed_back_screen/widgets/text_field_feedback.dart';
import 'package:user_library/screen/feed_back_screen/widgets/statistic_feedback.dart';
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
        .add(FetchFeedback(bookId: widget.book.id, page: 1));
  }

  void refreshRating() {
    // print(123123);
    // FeedbackScreenBloc.eventController.sink
    //     .add(FetchFeedbackEvent(bookGroupID: 1, rating: -1));
  }

  void sendFeedback(FeedbackDTO dto) {
    //feedback_bloc.eventController.sink.add(SentFeedbackEvent(dto));
  }

  void PopupSort() {
    PopupFeedback('Sorted by', sorted, context, sortBy);
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
                            StatisticFeedback(
                              refresh: refreshRating,
                              total: snapshot.data.totalFeedback,
                              rating: widget.book.rating,
                              countRating: snapshot.data.rating,
                            ),
                            Divider(
                              color: Colors.black,
                              height: 30,
                              indent: 20,
                              endIndent: 20,
                              thickness: 1,
                            ),
                            GestureDetector(
                              onTap: () {
                                this.PopupSort();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15, bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Sorted by',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    Icon(
                                      Icons.filter_list_sharp,
                                      color: Colors.black38,
                                    ),
                                  ],
                                ),
                              ),
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
          AppBarCustom(
              background: Colors.white,
              back: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              title: Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'images/bama.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6),
                      child: Text(
                        widget.book.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'RobotoMono'),
                      ),
                    )
                  ],
                ),
              )),
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
