import 'package:flutter/material.dart';
import 'package:user_library/screen/home_screen/home_screen.dart';
import 'package:user_library/widgets/bottombar.dart';

class MainLayout extends StatefulWidget {
  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  final pageController = PageController(initialPage: 0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        allowImplicitScrolling: false,
        children: [
          HomeScreen(),
          Container(
            child: Text("asdasd"),
          ),
          Container(
            child: Text("213123"),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(handelPageView: handelPageView),
    );
  }

  handelPageView(int page) {
    pageController.jumpToPage(page);
  }
}
