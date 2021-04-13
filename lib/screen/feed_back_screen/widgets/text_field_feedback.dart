import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:user_library/context.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/models/user_feedback.dart';
import 'package:user_library/widgets/loading_circle.dart';

class TextFieldFeedback extends StatefulWidget {
  final int bookGroupID;
  final Function(UserFeedback) afterSendFeedback;
  const TextFieldFeedback({
    Key key,
    this.afterSendFeedback,
    this.bookGroupID,
  }) : super(key: key);
  @override
  _TextFieldFeedbackState createState() => _TextFieldFeedbackState();
}

class _TextFieldFeedbackState extends State<TextFieldFeedback> {
  TextEditingController txtSearch;
  double sizeRating = 200;
  int rate = 5;
  bool hasContent = false;
  bool isWait = false;

  @override
  void initState() {
    txtSearch = TextEditingController();
    sizeRating = 200;
    super.initState();
  }

  bool validMessage() {
    if (rate == -1) {
      return false;
    }
    if (txtSearch.text.trim().length == 0) {
      return false;
    }
    return true;
  }

  UserFeedback createFeedback(int rate, String content) {
    return UserFeedback.feedbackID(
      bookGroupID: this.widget.bookGroupID,
      content: content,
      rating: rate,
      customerID: int.parse(contextData['customerID']),
    );
  }

  Future<void> _onSendPressed() async {
    setState(() {
      isWait = true;
    });
    if (validMessage()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userid = (prefs.getString('PAPV_UserID') ?? '-1');
      if (userid != '-1') {
        UserFeedback dto = new UserFeedback(
            content: txtSearch.text.trim(),
            customerId: int.parse(userid),
            bookGroupId: this.widget.bookGroupID,
            createdDate: DateTime.now(),
            rating: rate);
        FeedbackDAO().sentFeedback(dto).then((value) {
          this.widget.afterSendFeedback(value);
          txtSearch.text = '';
          hasContent = false;
        });
        setState(() {
          isWait = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sizeRating != 200
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      sizeRating = 200;
                    });
                  },
                  child: Container(
                      width: 50,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                      )),
                )
              : Container(
                  width: 120,
                  height: 58,
                  padding: EdgeInsets.only(left: 15, top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 16,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.7),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rate = rating.toInt();
                      });
                    },
                  ),
                ),
          Container(
            width: MediaQuery.of(context).size.width - sizeRating,
            height: 54,
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  hasContent = value.trim() != '';
                });
              },
              controller: txtSearch,
              onTap: () {
                setState(() {
                  sizeRating = 200;
                });
              },
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 20, left: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: "Share your feel",
                  filled: true,
                  fillColor: Colors.grey[200]),
            ),
          ),
          GestureDetector(
            onTap: () {
              _onSendPressed();
            },
            child: Container(
                width: 50,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: isWait
                    ? LoadingCircle(15, Colors.blue[400])
                    : Icon(
                        Icons.send,
                        color: hasContent ? Colors.blue[400] : Colors.grey,
                      )),
          ),
        ],
      ),
    );
  }
}
