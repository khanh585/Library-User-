import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:user_library/widget/popup.dart';

class TextFieldFeedback extends StatefulWidget {
  const TextFieldFeedback({
    Key key,
    this.onSendMessage,
  }) : super(key: key);

  final Function(String, String) onSendMessage;

  @override
  _TextFieldFeedbackState createState() => _TextFieldFeedbackState();
}

class _TextFieldFeedbackState extends State<TextFieldFeedback> {
  TextEditingController txtSearch;
  double sizeRating = 200;
  @override
  void initState() {
    // TODO: implement initState
    sizeRating = 200;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        // BoxShadow(
        //   spreadRadius: 1,
        //   blurRadius: 1,
        //   offset: Offset(0, 0),
        // )
      ], borderRadius: BorderRadius.circular(3)),
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
                  width: 200,
                  height: 58,
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 30,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.7),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
          Container(
            width: MediaQuery.of(context).size.width - 50 - sizeRating,
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: TextField(
              onTap: () {
                setState(() {
                  sizeRating = 50;
                });
              },
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 20, left: 15),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: "Share your feel",
                  filled: true,
                  fillColor: Colors.grey[200]),
            ),
          ),
          Container(
              width: 50,
              height: 58,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Icon(
                Icons.send,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
