import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/dao/LocationDAO.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/models/user_feedback.dart';
import 'package:user_library/models/location.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/database/database.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/models/wishlist.dart';
import 'package:user_library/screen/feed_back_screen/widgets/feedback_list.dart';
import 'package:user_library/screen/feed_back_screen/widgets/text_field_feedback.dart';
import 'package:user_library/screen/book_detail_screen_2/widgets/location_item.dart';

import '../../constants.dart';

class BookDetailLibrarianScreen extends StatefulWidget {
  final Book book;
  List<UserFeedback> feedbacks;
  BookDetailLibrarianScreen({this.book, this.feedbacks});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetailLibrarianScreen>
    with SingleTickerProviderStateMixin {
  bool _needConfirm = false;
  List<Location> _listLocation = new List();
  TabController _tabController;
  @override
  void initState() {
    _fetchLocation();
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  void _fetchLocation() {
    LocationDAO().fetchLocationByBookGroupId(this.widget.book.id).then((value) {
      setState(() {
        _listLocation = value;
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
                            margin: EdgeInsets.only(bottom: 30, top: 10),
                            width: 180,
                            height: 250,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                this.widget.book.image[0],
                                fit: BoxFit.contain,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: Image.asset(
                                      "images/loading1.gif",
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                },
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 25, right: 25),
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: TabBar(
                              isScrollable: false,
                              labelColor: kBlackColor,
                              unselectedLabelColor: kGreyColor,
                              labelStyle: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                              unselectedLabelStyle: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                  color: kBlackColor,
                                ),
                                insets: EdgeInsets.only(
                                    left: 12, right: 12, bottom: 4),
                              ),
                              tabs: [
                                Tab(
                                  text: 'Description',
                                ),
                                Tab(text: 'Location'),
                              ],
                              controller: _tabController,
                            )),
                        Expanded(
                          child: TabBarView(
                            children: [
                              this.widget.book.description != ''
                                  ? Container(
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
                                          )))
                                  : Center(
                                      child: Image.asset(
                                        "images/empty.png",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      for (Location item in _listLocation)
                                        LocationItem(
                                          location: item,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
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
