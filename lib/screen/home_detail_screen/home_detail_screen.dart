import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_event.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_bloc.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_state.dart';
import 'package:user_library/screen/home_detail_screen/widgets/new_book_section.dart';
import 'package:user_library/screen/book_detail_screen_2/book_detail_libarian_screen.dart';
import 'package:user_library/screen/home_detail_screen/widgets/suggest_book_section.dart';

import '../../constants.dart';
import '../book_detail_screen_2/widgets/custom_tab_indicator.dart';

class HomeDetailScreen extends StatefulWidget {
  final TmpUser user;
  HomeDetailScreen({this.user});
  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  final home_detail_bloc = HomeDetailBloc();
  var _search;
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
                  if (snapshot.data.listPopularBook.length != 0 &&
                      snapshot.data.listNewestBook.length != 0) {
                    return ListView(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 25, top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Hi, ' + this.widget.user.name,
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: kGreyColor),
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
                              TextFormField(
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
                                  onChanged: (value) {
                                    _search = value;
                                    if (_search != "") {
                                      searchBooks(_search);
                                    } else {
                                      setState(() {
                                        snapshot.data.listBooks = null;
                                      });
                                    }
                                  }),
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
                        SizedBox(height: 20),
                        Stack(
                          children: [
                            Positioned(
                              bottom: 220,
                              child: Container(
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                      unselectedLabelStyle:
                                          GoogleFonts.openSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                      indicator: RoundedRectangleTabIndicator(
                                          weight: 2,
                                          width: 10,
                                          color: kBlackColor),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            margin: EdgeInsets.only(right: 23),
                                            child: Text('New Arrival'),
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                            SuggestBookSection(
                                listSuggestBook: snapshot.data.listPopularBook),
                            snapshot.data.listBooks != null
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: snapshot.data.listBooks.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: 25, right: 25),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            color: kLightGreyColor),
                                        child: GestureDetector(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookDetailLibrarianScreen(
                                                        book: snapshot.data
                                                            .listBooks[index])),
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                '${snapshot.data.listBooks[index].name}'),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Text(""),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25, top: 15),
                          child: Text(
                            'Popular',
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: kBlackColor),
                          ),
                        ),
                        NewBookSection(
                            listNewestBook: snapshot.data.listPopularBook)
                      ],
                    );
                  } else {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "images/drone2.gif",
                              height: 250.0,
                              width: 250.0,
                            ),
                          ),
                          Positioned(
                            child: Text(
                              "Loading",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.orangeAccent[400]),
                            ),
                            top: 510,
                            left: 172,
                          )
                        ],
                      ),
                    );
                  }
                }
              }),
        ),
      ),
    );
  }

  Future<void> searchBooks(String name) {
    home_detail_bloc.eventController.sink.add(CleanBooks());
    home_detail_bloc.eventController.sink.add(FetchBooks(name: name));
  }
}
