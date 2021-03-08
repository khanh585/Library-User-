import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_event.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_bloc.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_state.dart';
import 'package:user_library/screen/home_detail_screen/widgets/new_book_section.dart';
import 'package:user_library/screen/home_detail_screen/widgets/suggest_book_section.dart';

import '../../constants.dart';
import '../book_detail_screen_2/widgets/custom_tab_indicator.dart';

class HomeDetailScreen extends StatefulWidget {
  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  final home_detail_bloc = HomeDetailBloc();
  @override
  void initState() {
    super.initState();
    home_detail_bloc.eventController.sink.add(FetchPopularBook());

    home_detail_bloc.eventController.sink.add(FetchNewestBook());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: StreamBuilder<HomeDetailState>(
              stream: home_detail_bloc.stateController.stream,
              initialData: home_detail_bloc.state,
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Text("Error");
                else {
                  return ListView(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 25,top: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Hi, Rizki',
                                style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kGreyColor),
                              ),
                              Text(
                                'Discover Latest Book',
                                style: GoogleFonts.openSans(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor),
                              ),
                            ],
                          )),
                      Container(
                        height: 39,
                        margin: EdgeInsets.only(left: 25, right: 25, top: 18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kLightGreyColor),
                        child: Stack(
                          children: <Widget>[
                            TextField(
                              maxLengthEnforced: true,
                              style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 19, right: 50, bottom: 8),
                                  border: InputBorder.none,
                                  hintText: 'Search book..',
                                  hintStyle: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: kGreyColor,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Positioned(
                              right: 0,
                              child: SvgPicture.asset(
                                  'icons/background_search.svg'),
                            ),
                            Positioned(
                              top: 8,
                              right: 9,
                              child: SvgPicture.asset(
                                  'icons/icon_search_white.svg'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(left: 25),
                        child: DefaultTabController(
                          length: 1,
                          child: TabBar(
                              labelPadding: EdgeInsets.all(0),
                              indicatorPadding: EdgeInsets.all(0),
                              isScrollable: true,
                              labelColor: kBlackColor,
                              unselectedLabelColor: kGreyColor,
                              labelStyle: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                              unselectedLabelStyle: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              indicator: RoundedRectangleTabIndicator(
                                  weight: 2, width: 10, color: kBlackColor),
                              tabs: [
                                Tab(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 23),
                                    child: Text('New'),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      SuggestBookSection(listSuggestBook: snapshot.data.listPopularBook),
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 25),
                        child: Text(
                          'Popular',
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: kBlackColor),
                        ),
                      ),
                      NewBookSection(listNewestBook: snapshot.data.listPopularBook)
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
