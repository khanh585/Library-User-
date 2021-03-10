import 'package:flutter/material.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/models/user_feedback.dart';
import 'package:user_library/screen/book_detail_screen_2/book_detail_screen.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class BookItemSuggestion extends StatefulWidget {
  final Book book;

  const BookItemSuggestion({Key key, this.book}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BookItemSuggestionState();
}

class BookItemSuggestionState extends State<BookItemSuggestion> {
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
                builder: (context) => BookDetailScreen(
                    book: this.widget.book, feedbacks: _listFeedback)),
          );
        },
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 120,
                      height: 180,
                      margin: EdgeInsets.only(bottom: 13),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(5, 8), // changes position of shadow
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
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
                        ),
                      )),
                  Text(
                    this.widget.book.name,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        this.widget.book.author,
                        style: TextStyle(
                            color: Colors.black12.withOpacity(0.4),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
