import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:user_library/constants.dart';
import 'package:user_library/screen/home_screen.dart';

import 'package:user_library/widget/profile/profile_background.dart';
import 'package:user_library/widget/profile/rounded_button.dart';

class Profile_Screen_Body extends StatefulWidget {
  Profile_Screen_Body({Key key}) : super(key: key);

  @override
  _Profile_Body_State createState() => _Profile_Body_State();
}

class _Profile_Body_State extends State<Profile_Screen_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Profile_Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: size.height * 0.01),
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://scontent.fsgn2-3.fna.fbcdn.net/v/t1.15752-9/136095187_408585673795242_3602683831188098354_n.png?_nc_cat=106&ccb=2&_nc_sid=ae9488&_nc_ohc=EoUlLuFmY6IAX9UTDeR&_nc_ht=scontent.fsgn2-3.fna&oh=848453cd7bde47fcd3a793511e253657&oe=601A7A47',
              ),
              radius: 80.0,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              width: size.width * 0.8,
              child: TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Container(
              width: size.width * 0.8,
              child: TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Container(
              width: size.width * 0.8,
              child: TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Container(
              width: size.width * 0.8,
              child: TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: 'Birthdate',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            RoundedButton(
              text: 'Update Profile',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home_Screen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
