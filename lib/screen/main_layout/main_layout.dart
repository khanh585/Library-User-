import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/models/notification.dart';
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
    _firebaseTriger(context);
    super.initState();
  }

  void _firebaseTriger(BuildContext context) async {
    _firebaseMessaging.getToken().then((token) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      this.widget.user.password = prefs.getString('PAPV_Password');
      this.widget.user.deviceToken = token;

      CustomerDAO().updateUser(this.widget.user.id, this.widget.user);
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        UserNotification noti = UserNotification.fromMessage(message);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => NotifyPopup(
            context: context,
            noti: noti,
          ),
        );
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        UserNotification noti = UserNotification.fromMessage(message);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => NotifyPopup(
            context: context,
            noti: noti,
          ),
        );
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
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
