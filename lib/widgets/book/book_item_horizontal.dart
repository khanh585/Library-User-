import 'package:flutter/material.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/models/user_feedback.dart';
import 'package:user_library/screen/book_detail_screen_2/book_detail_screen.dart';

class BookItemHorizontal extends StatefulWidget {
  final Book book;

  const BookItemHorizontal({Key key, this.book}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BookItemHorizontalState();
}

class BookItemHorizontalState extends State<BookItemHorizontal> {
  List<UserFeedback> _listFeedback = [];
  @override
  void initState() {
    super.initState();
    fetchFeedback().then((value) => _listFeedback = value);
  }

  Future<List<UserFeedback>> fetchFeedback() async {
    List response =
        await FeedbackDAO().fetchFeedback(this.widget.book.id, 1, 10);
    List<UserFeedback> listFeedbacks = response[0];
    return listFeedbacks;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetailScreen(book: this.widget.book, feedbacks: _listFeedback)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 80,
                height: 120,
                margin: EdgeInsets.only(bottom: 13),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    this.widget.book.image[0],
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Image.asset(
                    "images/loading1.gif",
                    height: 550.0,
                    width: 750.0,
                  ),
                      );
                    },
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width - 140,
              height: 120,
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this.widget.book.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 2, bottom: 5),
                      child: Text(
                        this.widget.book.author,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                      )),
                  Container(
                      height: 45,
                      margin: EdgeInsets.only(bottom: 10),
                      child: 
                      this.widget.book.description!=null ? 
                      Text(
                        this.widget.book.description,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2),
                        maxLines: 3,
                      ) : Text(
                        "No description",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2),
                        maxLines: 3,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
