import 'package:flutter/material.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/home_screen/home_screen.dart';
import 'package:user_library/screen/profile_screen/main_profile_screen.dart';
import 'package:user_library/screen/scanner_screen/scanner_screen.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen.dart';
import 'package:user_library/widgets/bottombar.dart';

import 'package:user_library/screen/search_screen/search_screen.dart';

class MainLayout extends StatefulWidget {
  final TmpUser user;
  MainLayout({this.user});
  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    super.initState();
  }

  final pageController = PageController(initialPage: 0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: PageView(
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        allowImplicitScrolling: false,
        children: [
          HomeScreen(user: this.widget.user),
          WishListScreen(),
          ScannerScreen(),
          MainProfileScreen(customerId: int.parse(this.widget.user.id)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen())),
          backgroundColor: Colors.blueGrey,
          child: Icon(
            Icons.search,
            size: 28,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        color: Colors.blueGrey,
        child: BottomBar(handelPageView: handelPageView),
      ),
    );
  }

  handelPageView(int page) {
    pageController.jumpToPage(page);
  }
}
