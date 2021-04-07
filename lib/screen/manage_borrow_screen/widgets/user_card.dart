import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/models/customer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_library/screen/manage_borrow_screen/widgets/circle_profile.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/progress_circle_indicator.dart';
import '../../borrow_detail_screen/borrow_detail_screen.dart';

class UserCard extends StatelessWidget {
  final List<Customer> customer;

  const UserCard({Key key, this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: customer.length,
          itemBuilder: (context, index) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffff8a65),
                    Color(0xffff5722),
                  ],
                ),
              ),
              child: Dismissible(
                key: Key(customer[index].name),
                background: Container(
                  padding: const EdgeInsets.only(left: 25),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                confirmDismiss: (dismissDirection) async {
                  if (dismissDirection == DismissDirection.startToEnd) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return BorrowDetailScreen(
                            customer: customer[index],
                          );
                        },
                      ),
                    );
                  }

                  return false;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 30),
                  decoration: BoxDecoration(
                    color: Color(0xfffbfafd),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: <Widget>[
                      Hero(
                        tag: customer[index].name,
                        child: CircleProfile(
                          image: customer[index].image != null
                              ? customer[index].image
                              : "https://hackernoon.com/images/0*4Gzjgh9Y7Gu8KEtZ.gif",
                          width: 50,
                          height: 50,
                          acceptSize: 15,
                          acceptRight: 0,
                          acceptTop: 2,
                          accepted: true,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            customer[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            customer[index].name,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      ProgressCircleIndicator(
                        completedPercentage: 100,
                        radius: 30,
                        fontSize: 15,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // Positioned(
        //   bottom: 637,
        //   left: 0,
        //   right: 0,
        //   top: 0,
        //   child: Container(
        //     height: 140,
        //     margin: EdgeInsets.only(left: 25, right: 25, top: 18),
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         color: kLightGreyColor),
        //     child: Stack(
        //       children: <Widget>[
        //         TextFormField(
        //             maxLengthEnforced: true,
        //             style: GoogleFonts.openSans(
        //                 fontSize: 16,
        //                 color: kBlackColor,
        //                 fontWeight: FontWeight.w600),
        //             decoration: InputDecoration(
        //                 contentPadding:
        //                     EdgeInsets.only(left: 19, right: 50, bottom: 8),
        //                 border: InputBorder.none,
        //                 hintText: 'Search customer..',
        //                 hintStyle: GoogleFonts.openSans(
        //                     fontSize: 16,
        //                     color: kGreyColor,
        //                     fontWeight: FontWeight.w600)),
        //             onChanged: (value) {
        //               // _search = value;
        //               // if (_search != "") {
        //               //   searchBooks(_search);
        //               // } else {
        //               //   setState(() {
        //               //     snapshot.data.listBooks = null;
        //               //   });
        //               // }
        //             }),
        //         Positioned(
        //           right: 0,
        //           child: SvgPicture.asset('icons/background_search.svg'),
        //         ),
        //         Positioned(
        //           top: 8,
        //           right: 9,
        //           child: SvgPicture.asset('icons/icon_search_white.svg'),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
  // Future<void> searchBooks(String name) {
  //   home_detail_bloc.eventController.sink.add(CleanBooks());
  //   home_detail_bloc.eventController.sink.add(FetchBooks(name: name));
  // }
}
