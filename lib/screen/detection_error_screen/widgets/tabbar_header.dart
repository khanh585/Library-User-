import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/constants.dart';

class Tabbar_Header extends StatelessWidget {
  const Tabbar_Header({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        //labelPadding: EdgeInsets.all(0),
        //indicatorPadding: EdgeInsets.all(0),
        isScrollable: false,
        labelColor: kBlackColor,
        //unselectedLabelColor: kGreyColor,
        indicatorColor: Colors.orange[900],
        indicatorWeight: 3,
        labelStyle: GoogleFonts.openSans(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        unselectedLabelStyle: GoogleFonts.openSans(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        tabs: [
          Tab(
              icon: Icon(Icons.error_sharp, color: Colors.red[400]),
              text: 'Error'),
          Tab(
              icon: Icon(
                Icons.cancel,
                color: Colors.amber,
              ),
              text: 'Rejected'),
          Tab(
              icon: Icon(Icons.check_box, color: Colors.green),
              text: 'Confirmed'),
        ],
        controller: _tabController,
      ),
    );
  }
}
