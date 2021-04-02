import 'package:flutter/material.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/models/user_feedback.dart';
import '../../constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/screen/book_detail_screen_2/book_detail_screen.dart';

class BookItemGrid extends StatefulWidget {
  final Book book;

  const BookItemGrid({Key key, this.book}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BookItemGridState();
}

class BookItemGridState extends State<BookItemGrid> {
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
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookDetailScreen(
                book: this.widget.book, feedbacks: _listFeedback)),
      ),
      child: Container(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 170,
              child: this.widget.book.image != null &&
                      this.widget.book.image.isNotEmpty
                  ? Image.network(
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
                    )
                  : Image.asset("images/notebook.png", fit: BoxFit.fill),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    child: Text(
                  this.widget.book.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  this.widget.book.author,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                )),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     Text(
            //       '\$',
            //       style: TextStyle(
            //           fontSize: 14,
            //           color: Color(0xFF9966).withOpacity(1),
            //           fontWeight: FontWeight.w600),
            //     ),
            //     Text(
            //       this.widget.book.fee.toString(),
            //       style: TextStyle(
            //           fontSize: 22,
            //           color: Color(0xFF9966).withOpacity(0.95),
            //           fontWeight: FontWeight.w600),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
