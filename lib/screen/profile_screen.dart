import 'package:flutter/material.dart';
import 'package:user_library/screen/home_screen.dart';
import 'package:user_library/widget/profile/profile_body.dart';

class Profile_Screen extends StatefulWidget {
  Profile_Screen({Key key}) : super(key: key);

  @override
  _Profile_Screen_ScreenState createState() => _Profile_Screen_ScreenState();
}

class _Profile_Screen_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Home_Screen();
              },
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'PROFILE',
          textAlign: TextAlign.center,
        ),
      ),
      body: Profile_Screen_Body(),
    );
  }
}
