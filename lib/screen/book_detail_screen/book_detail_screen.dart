import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:user_library/helper/database_helper.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/widgets/animation/fade_side_up.dart';

import 'package:user_library/widgets/app_bar_custom.dart';
import 'package:user_library/widgets/description_handel.dart';
import 'package:user_library/screen/book_detail_screen/widgets/list_categories.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  BookDetailScreen({this.book});

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeSideUp(
        1,
        Container(
          color: Colors.white,
          child: ListView(
            children: [
              AppBarCustom(
                // background: Colors.white,
                back: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "Book Detail",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 150,
                        height: 205,
                        margin: EdgeInsets.only(bottom: 13),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 8), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: widget.book.image != null &&
                                  widget.book.image.length != 0
                              ? Image.network(
                                  this.widget.book.image[0],
                                  fit: BoxFit.fill,
                                  width: 170,
                                  height: 135,
                                )
                              : Image.asset(
                                  "images/notebook.png",
                                  fit: BoxFit.fill,
                                  width: 160,
                                  height: 230,
                                ),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          this.widget.book.author,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                    Container(
                      width: 340,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        this.widget.book.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            height: 1.3,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 5,
                        children: [
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: this.widget.book.rating != null
                                ? this.widget.book.rating.toDouble()
                                : 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 16,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          Container(
                            width: 55,
                            child: Row(
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
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  ' / 5.0',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(5),
                          child: DescriptionHandel(
                              text: this.widget.book.description.toString())),
                      SizedBox(
                        height: 10,
                      ),
                      ListCategories(
                        categoies: this.widget.book.categories,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: EdgeInsets.only(top: 30, bottom: 25),
                          child: Divider(
                            height: 1,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      FlatButton(
                          onPressed: () {
                            DatabaseHelper.instance
                                .insertBook(this.widget.book);
                          },
                          child: Container(
                            height: 48,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                "Add to Wishlist ",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
