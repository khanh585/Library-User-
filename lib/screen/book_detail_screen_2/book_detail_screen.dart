import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/models/user_feedback.dart';
import 'package:user_library/screen/book_detail_screen_2/widgets/custom_tab_indicator.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/database/database.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/models/wishlist.dart';
import 'package:user_library/screen/feed_back_screen/widgets/feedback_list.dart';
import 'package:user_library/screen/feed_back_screen/widgets/text_field_feedback.dart';

import '../../constants.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  final List<UserFeedback> feedbacks;
  BookDetailScreen({this.book, this.feedbacks});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetailScreen>
    with SingleTickerProviderStateMixin {
  bool _inWishList = false;
  TabController _tabController;
  @override
  void initState() {
    _checkInWishList();
    _tabController = new TabController(length: 2, vsync: this);
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
            }));
  }

  Future<void> _addToWishList() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final wishListDAO = database.wishListDao;
    final id = this.widget.book.id;
    final name = this.widget.book.name;
    final author = this.widget.book.author;
    final thumnail =
        this.widget.book.image.length != 0 ? this.widget.book.image[0] : '';

    final wish = WishList(id, name, author, thumnail, true);
    wishListDAO.insertWishList(wish);
    setState(() {
      _inWishList = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        color: Colors.transparent,
        child: FlatButton(
          color: Color(0xFF9966).withOpacity(0.95),
          onPressed: () => _addToWishList(),
          child: Text(
            'Add to wishlist',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: kWhiteColor),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
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
                      // Positioned(
                      //   left: 25,
                      //   top: 35,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.pushReplacementNamed(
                      //           context, "/HomeDetailScreen");
                      //     },
                      //     child: Container(
                      //       width: 32,
                      //       height: 32,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           color: kWhiteColor),
                      //       child: SvgPicture.asset(
                      //           'icons/icon_back_arrow.svg'),
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 40),
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(this.widget.book.image[0]),
                            ),
                          ),
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
                                ),
                                Tab(text: 'Feedbacks'),
                              ],
                              controller: _tabController,
                              //indicatorSize: TabBarIndicatorSize.tab,
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
                              SingleChildScrollView(
                                child: Container(
                                    width: 600,
                                    //height: 600,
                                    margin: EdgeInsets.only(left: 9, top: 15),
                                    child: Column(
                                      children: [
                                        TextFieldFeedback(),
                                        Divider(
                                          color: Colors.black,
                                          height: 30,
                                          indent: 20,
                                          endIndent: 20,
                                          thickness: 1,
                                        ),
                                        FeebackList(
                                          listData: this.widget.feedbacks,
                                        ),
                                      ],
                                    )),
                              )
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
// class BookDetailScreen extends StatelessWidget {
//   final PopularBookModel popularBookModel;

//   BookDetailScreen({Key key, @required this.popularBookModel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   }
// }
