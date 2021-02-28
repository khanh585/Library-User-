
import 'package:flutter/material.dart';
import 'package:user_library/bloc/Feedback_bloc.dart';
import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/event/Feedback_event.dart';
import 'package:user_library/state/Feedback_state.dart';
import 'package:user_library/widgets/app_bar_custom.dart';
import 'package:user_library/screen/feed_back_screen/widgets/popupFeedback.dart';
import 'package:user_library/screen/feed_back_screen/widgets/text_field_feedback.dart';
import 'package:user_library/screen/feed_back_screen/widgets/statistic_feedback.dart';
import 'package:user_library/screen/feed_back_screen/widgets/feedback_list.dart';

class Feedback_Screen extends StatefulWidget {
  Feedback_Screen({Key key}) : super(key: key);

  @override
  _Feedback_ScreenState createState() => _Feedback_ScreenState();
}

class _Feedback_ScreenState extends State<Feedback_Screen> {
  final feedback_bloc = FeedbackBloc();
  int sorted = -1;
  @override
  void initState() {
    refreshRating();
    super.initState();
  }

  void refreshRating() {
    feedback_bloc.eventController.sink
        .add(FetchFeedbackEvent(bookGroupID: 1, rating: -1));
  }

  void sendFeedback(FeedbackDTO dto) {
    feedback_bloc.eventController.sink.add(SentFeedbackEvent(dto));
  }

  void PopupSort() {
    PopupFeedback('Sorted by', sorted, context, sortBy);
  }

  void sortBy(int sorted) {
    feedback_bloc.eventController.sink.add(SortedFeedbackEvent(sorted));

    setState(() {
      this.sorted = sorted;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double he = MediaQuery.of(context).size.height;
    // double wi = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: [ 
          SingleChildScrollView(
            child: StreamBuilder<FeedbackState>(
                stream: feedback_bloc.stateController.stream,
                initialData: feedback_bloc.state,
                builder: (context, snapshot) {
                  print("RENDER");
                  return Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),

                      // BookInfo(),
                      // TotalFeedback(
                      //   refresh: refreshRating,
                      //   total: snapshot.data.total,
                      //   feedbacks: snapshot.data.typeFeedbacks,
                      // ),
                      Divider(
                        color: Colors.black,
                        height: 50,
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          this.PopupSort();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
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

                      // ViewAllFeedback(
                      //   listData: snapshot.data.feedbacks,
                      // ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  );
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: AppBarCustom(
                background: Colors.white,
                back: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                ),
                title: Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.asset(
                          'images/bama.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The Tiny Dragon',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'RobotoMono'),
                            ),
                            Text(
                              'Author',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'RobotoMono'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
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
