import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/detection_screen/detection_screen.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_screen.dart';

import 'package:user_library/screen/manage_borrow_screen/manage_borrow_screen.dart';
import 'package:user_library/screen/profile_screen/main_profile_screen.dart';
import 'package:user_library/service/utils.dart';

class GridDashboard extends StatelessWidget {
  final TmpUser user;
  GridDashboard({this.user});
  Items item1 = new Items(
      title: "Manage Book", subtitle: "", event: "", img: "images/book.png");
  Items item4 = new Items(
    title: "Return Book",
    subtitle: "",
    event: "",
    img: "images/return-book.png",
  );
  Items item5 = new Items(
    title: "Borrow Book",
    subtitle: "",
    event: "",
    img: "images/borrow-book.png",
  );
  Items item6 = new Items(
    title: "Manage Borrow",
    subtitle: "",
    event: "",
    img: "images/profile.png",
  );

  Items item2 = new Items(
    title: "Profile",
    subtitle: "",
    event: "",
    img: "images/profile.png",
  );

  Items item3 = new Items(
    title: "Error Checklist",
    subtitle: "",
    event: "",
    img: "images/checklist.png",
  );
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item4, item5, item6, item2, item3];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
                onTap: () {
                  if (data.title == "Manage Book") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailScreen(
                                user: this.user,
                              )),
                    );
                  } else if (data.title == "Manage Borrow") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManageBorrowScreen()),
                    );
                  } else if (data.title == "Borrow Book") {
                    Util().sendRequest("Borrow");
                  } else if (data.title == "Return Book") {
                    Util().sendRequest("Return");
                  } else if (data.title == "Error Checklist") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetectionScreen()),
                    );
                  } else if (data.title == "Profile") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainProfileScreen(
                                customerId: int.parse(this.user.id),
                                roleId: this.user.roleId,
                              )),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange[600].withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        width: 42,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.title,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.orange[900],
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ));
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
