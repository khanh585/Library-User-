import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/home_screen/home_screen.dart';
import 'package:user_library/screen/notification_screen/widgets/notify_popup.dart';
import 'package:user_library/screen/profile_screen/main_profile_screen.dart';
import 'package:user_library/screen/wishlist_screen_2/wishlist_screen_2.dart';
import 'package:user_library/widgets/bottombar.dart';
import 'package:user_library/screen/search_screen/search_screen.dart';

class MainLayout extends StatefulWidget {
  final TmpUser user;
  MainLayout({this.user});
  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _message = '';
  @override
  void initState() {
    _registerOnFirebase();
    getMessage();
    super.initState();
  }

  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.autoInitEnabled().then((bool enabled) => print(enabled));
    _firebaseMessaging.setAutoInitEnabled(true).then((_) => _firebaseMessaging
        .autoInitEnabled()
        .then((bool enabled) => print(enabled)));
    _firebaseMessaging.getToken().then((token) {
      this.widget.user.deviceToken = token;
      CustomerDAO().updateUser(this.widget.user.id, this.widget.user);
    });
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
      _firebaseMessagingBackgroundHandler(message);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => NotifyPopup(
          context: context,
          time: 'Thieu',
          content: message["notification"]["body"],
        ),
      );
    }, onResume: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onResume: $message");
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      Map<String, dynamic> message) async {
    await Firebase.initializeApp();

    print("Handling a background message: ${message}");
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
          SearchScreen(),
          MainProfileScreen(
              customerId: int.parse(this.widget.user.id),
              roleId: this.widget.user.roleId),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFF9966).withOpacity(1),
        child: BottomBar(handelPageView: handelPageView),
      ),
    );
  }

  handelPageView(int page) {
    pageController.jumpToPage(page);
  }
}
