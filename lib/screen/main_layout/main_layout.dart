import 'package:flutter/material.dart';
import 'package:user_library/screen/home_screen/home_screen.dart';
import 'package:user_library/screen/profile_screen/main_profile_screen.dart';
import 'package:user_library/widgets/bottombar.dart';
import 'package:user_library/widgets/checkin/scanner.dart';

import '../notification_screen/notification_screen.dart';

class MainLayout extends StatefulWidget {
  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
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
          HomeScreen(),
          MainProfileScreen(),
          Scanner_Screen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => Scanner_Screen())),
          backgroundColor: Colors.blueGrey,
          child: Icon(
            Icons.qr_code,
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
