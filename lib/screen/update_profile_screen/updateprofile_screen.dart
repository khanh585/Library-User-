import 'package:flutter/material.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/update_profile_screen/widgets/body.dart';

class UpdateProfileScreen extends StatelessWidget {
  final TmpUser user;
  final Function refresh;

  const UpdateProfileScreen({this.user, this.refresh});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, opacity: 0.7),
        automaticallyImplyLeading: true,
        toolbarHeight: 50,
        leadingWidth: 25,
        elevation: 0,
        title: Text(
          "Update Profile",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              letterSpacing: 1),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: Body(
        user: this.user,
        refresh: this.refresh,
      ),
    );
  }
}
