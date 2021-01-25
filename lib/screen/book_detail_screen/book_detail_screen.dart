import 'package:flutter/material.dart';
import 'package:user_library/bloc/Feedback_bloc.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/dto/BookDTO.dart';
import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/feed_back_screen/feedback_screen.dart';
import 'package:user_library/screen/feedback_screen1.dart';
import 'package:user_library/widgets/add_book_bar.dart';
import 'package:user_library/widgets/app_bar_custom.dart';
import 'package:user_library/widgets/description_handel.dart';
import 'package:user_library/screen/feed_back_screen/widgets/feedback_list.dart';
import 'package:user_library/screen/book_detail_screen/widgets/list_categories.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  BookDetailScreen({this.book});

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  double rating = 0;
  List<FeedbackDTO> listFeedbacks = [];

  @override
  void initState() {
    super.initState();
  }

  void subFeedback() async {
    // //Map data = await FeedbackDAO().fetchFeedback(this.widget.book.id, -1);
    // if (data == null) {
    //   return;
    // }
    // data['list'].forEach((FeedbackDTO element) {
    //   rating += element.rating;
    // });
    // rating = rating / data['list'].length;
    // int le = 2;
    // if (le > data['list'].length) {
    //   le = data['list'].length;
    // }
    // for (int i = 0; i < le; i++) {
    //   listFeedbacks.add(data['list'][i]);
    // }

    // setState(() {
    //   rating = rating;
    //   listFeedbacks = listFeedbacks;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 20 * 18,
              decoration: new BoxDecoration(
                  color: Colors.black,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: widget.book.image != null &&
                            widget.book.image.length != 0
                        ? NetworkImage(
                            widget.book.image[0],
                          )
                        : AssetImage("images/notebook.png"),
                  )),
              child: Text("")),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: widget.book.image != null &&
                              widget.book.image.length != 0
                          ? Image.network(
                              this.widget.book.image[0],
                              fit: BoxFit.fill,
                              width: 160,
                              height: 230,
                            )
                          : Image.asset(
                              "images/notebook.png",
                              fit: BoxFit.fill,
                              width: 160,
                              height: 230,
                            ),
                    ),
                    Container(
                      width: 320,
                      child: Text(
                        this.widget.book.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          this.widget.book.author,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    this.widget.book.rating != null
                                        ? this
                                            .widget
                                            .book
                                            .rating
                                            .toStringAsFixed(1)
                                        : '0.0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Rating',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(height: 40, width: 1, color: Colors.grey),
                          Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${this.widget.book.pageNumber}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Page',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(6)),
                      height: 30,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: ListCategories(
                        categoies: this.widget.book.categories,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(5),
                                child: DescriptionHandel(
                                    text: this
                                        .widget
                                        .book
                                        .description
                                        .toString())),
                            Divider(
                              height: 10,
                              thickness: 1,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      // ViewAllFeedback(
                      //   listData: this.listFeedbacks,
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedbackScreen(
                                        book: widget.book,
                                      )));
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'View feedbacks',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 15),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          AddBookButton(
            book: this.widget.book,
          ),
          // Appbar
          AppBarCustom(
            // background: Colors.white,
            back: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            title: Text(
              "Book Detail",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
