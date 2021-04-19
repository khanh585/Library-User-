import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_bloc.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_event.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_state.dart';
import 'package:user_library/screen/manage_borrow_screen/widgets/user_card.dart';

class ManageBorrowScreen extends StatefulWidget {
  const ManageBorrowScreen({Key key}) : super(key: key);

  @override
  _ManageBorrowState createState() => _ManageBorrowState();
}

class _ManageBorrowState extends State<ManageBorrowScreen> {
  final manage_borrow_bloc = ManageBorrowBloc();
  var _search;
  @override
  void initState() {
    super.initState();
    manage_borrow_bloc.eventController.sink.add(FetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black, opacity: 0.7),
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          leadingWidth: 25,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: Column(
            children: <Widget>[
              Text(
                'List patrons borrow',
                style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: StreamBuilder<ManageBorrowState>(
            stream: manage_borrow_bloc.stateController.stream,
            initialData: manage_borrow_bloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text("Error");
              if (snapshot.data.listUser == null ||
                  snapshot.data.listUser.length == 0) {
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
              if (snapshot.data.listUser != null) {
                return ListView(
                  children: [
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(left: 15, right: 15, top: 18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kLightGreyColor),
                      child: Stack(
                        children: <Widget>[
                          TextFormField(
                              maxLengthEnforced: true,
                              style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 19, right: 50, bottom: 8),
                                  border: InputBorder.none,
                                  hintText: 'Search patron..',
                                  hintStyle: GoogleFonts.openSans(
                                      fontSize: 16,
                                      color: kGreyColor,
                                      fontWeight: FontWeight.w600)),
                              onChanged: (value) {
                                _search = value;
                                if (_search != "") {
                                  searchBooks(_search);
                                } else {
                                  setState(() {
                                    snapshot.data.listUserSearch = null;
                                    _search = null;
                                  });
                                }
                              }),
                          Positioned(
                            right: 0,
                            child:
                                SvgPicture.asset('icons/background_search.svg'),
                          ),
                          Positioned(
                            top: 8,
                            right: 9,
                            child:
                                SvgPicture.asset('icons/icon_search_white.svg'),
                          )
                        ],
                      ),
                    ),
                    _search != null
                        ? Stack(
                            children: [
                              UserCard(
                                customer: snapshot.data.listUser,
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: snapshot.data.listUserSearch != null
                                    ? ListView.builder(
                                        //shrinkWrap: true,
                                        //physics: ClampingScrollPhysics(),
                                        itemCount:
                                            snapshot.data.listUserSearch.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                color: kLightGreyColor),
                                            child: GestureDetector(
                                              // onTap: () => Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           BookDetailLibrarianScreen(
                                              //               book: snapshot.data
                                              //                   .listBooks[index])),
                                              // ),
                                              child: ListTile(
                                                title: Text(
                                                    '${snapshot.data.listUserSearch[index].name}'),
                                                subtitle: Text("Username: " +
                                                    '${snapshot.data.listUserSearch[index].username}'),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Text(""),
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: snapshot.data.listUserSearch != null
                                    ? ListView.builder(
                                        //shrinkWrap: true,
                                        //physics: ClampingScrollPhysics(),
                                        itemCount:
                                            snapshot.data.listUserSearch.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                color: kLightGreyColor),
                                            child: GestureDetector(
                                              // onTap: () => Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           BookDetailLibrarianScreen(
                                              //               book: snapshot.data
                                              //                   .listBooks[index])),
                                              // ),
                                              child: ListTile(
                                                title: Text(
                                                    '${snapshot.data.listUserSearch[index].name}'),
                                                subtitle: Text("Username: " +
                                                    '${snapshot.data.listUserSearch[index].username}'),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Text(""),
                              ),
                              UserCard(
                                customer: snapshot.data.listUser,
                              ),
                            ],
                          ),
                  ],
                );
              }
            }));
  }

  Future<void> searchBooks(String name) {
    manage_borrow_bloc.eventController.sink.add(CleanCustomers());
    manage_borrow_bloc.eventController.sink.add(FetchCustomers(name: name));
  }
}
