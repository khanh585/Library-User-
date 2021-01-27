import 'package:flutter/material.dart';
import 'package:user_library/screen/home_screen/home_screen.dart';
import 'package:user_library/screen/profile_screen/main_profile_screen.dart';
import 'package:user_library/screen/view_detail_borrow_book/borrow_detail_screen.dart';
import 'package:user_library/screen/view_detail_borrow_book/widgets/view_all_borrow_detail.dart';
import 'package:user_library/widgets/bottombar.dart';
import 'package:user_library/widgets/checkin/scanner.dart';

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
      body: PageView(
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        allowImplicitScrolling: false,
        children: [
          HomeScreen(),
<<<<<<< Updated upstream
          Container(
            child: Text("asdasd"),
          ),
          Container(
            child: Text("213123"),
          ),
=======
          MainProfileScreen(),
          Borrow_Detail_Screen(),
          Scanner_Screen()
>>>>>>> Stashed changes
        ],
      ),
      bottomNavigationBar: BottomBar(handelPageView: handelPageView),
    );
  }

  handelPageView(int page) {
    pageController.jumpToPage(page);
  }
}
