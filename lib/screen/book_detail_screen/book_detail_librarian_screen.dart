import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/models/user_feedback.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/database/database.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/models/wishlist.dart';

import '../../constants.dart';

class BookDetailLibrarianScreen extends StatefulWidget {
  final Book book;
  List<UserFeedback> feedbacks;
  BookDetailLibrarianScreen({this.book, this.feedbacks});

  @override
  _BookDetailLibrarianState createState() => _BookDetailLibrarianState();
}

class _BookDetailLibrarianState extends State<BookDetailLibrarianScreen>
    with SingleTickerProviderStateMixin {
  bool _inWishList = false;
  bool _needConfirm = false;
  TabController _tabController;
  @override
  void initState() {
    _checkInWishList();
    _tabController = new TabController(length: 1, vsync: this);
    super.initState();
  }

  Future<void> _checkInWishList() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final wishListDAO = database.wishListDao;
    wishListDAO
        .findWishListById(this.widget.book.id)
        .then((value) => setState(() {
              _inWishList = value != null;
              _needConfirm = false;
            }));
  }

  Future<void> _addToWishList() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final wishListDAO = database.wishListDao;
    final id = this.widget.book.id;
    final name = this.widget.book.name;
    final author = this.widget.book.author;
    final fee = this.widget.book.fee;
    final image =
        this.widget.book.image.length != 0 ? this.widget.book.image[0] : '';

    final wish = WishList(id, name, author, fee, image, true);

    wishListDAO.insertWishList(wish);
    wishListDAO
        .findWishListById(id)
        .then((value) => {print('====' + value.image.toString())});

    setState(() {
      _inWishList = true;
    });
  }

  Future<void> _removeFromWishList(int bookID) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final wishListDAO = database.wishListDao;

    wishListDAO.findWishListById(bookID).then((value) {
      wishListDAO.deleteWishLists(value);
      setState(() {
        _inWishList = value == null;
      });
    });
  }

  Future<void> _afterSendFeedBack(UserFeedback dto) async {
    if (dto != null) {
      setState(() {
        this.widget.feedbacks.insert(0, dto);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Color(0xff9966).withOpacity(0.5),
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                flexibleSpace: Container(
                  //color: Color(this.widget.book.color),
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 40),
                            width: 180,
                            height: 250,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                this.widget.book.image[0],
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
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
                            )
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(10),
                            //   image: DecorationImage(
                            //     image: NetworkImage(this.widget.book.image[0]),
                            //   ),
                            // ),
                            ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 25),
                  child: Text(
                    this.widget.book.name,
                    style: GoogleFonts.openSans(
                        fontSize: 27,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7, left: 25),
                  child: Text(
                    this.widget.book.author,
                    style: TextStyle(
                        fontSize: 14,
                        color: kGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 7, left: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF9966).withOpacity(1),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          this.widget.book.fee.toString(),
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xFF9966).withOpacity(1),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                Container(
                  height: 258,
                  margin: EdgeInsets.only(top: 23, bottom: 36),
                  //padding: EdgeInsets.only(right: 50),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TabBar(
                              //labelPadding: EdgeInsets.all(0),
                              //indicatorPadding: EdgeInsets.all(0),

                              isScrollable: true,
                              labelColor: kBlackColor,
                              unselectedLabelColor: kGreyColor,
                              labelStyle: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                              unselectedLabelStyle: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),

                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                  //width: 100,
                                  color: kBlackColor,
                                ),
                                insets: EdgeInsets.only(
                                    left: 17, right: 8, bottom: 4),
                              ),

                              tabs: [
                                Tab(
                                  text: 'Description',
                                )
                              ],
                              controller: _tabController,
                            )),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 28),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      this.widget.book.description,
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: kGreyColor,
                                        letterSpacing: 1.5,
                                        height: 2,
                                      ),
                                    ),
                                  )),
                            ],
                            controller: _tabController,
                          ),
                        ),
                      ]),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
