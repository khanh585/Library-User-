import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/screen/home_screen/home_screen.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_screen.dart';
import 'package:user_library/screen/profile_screen/widgets/full_profile.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Manage Book",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "images/book.png");

  Items item2 = new Items(
    title: "Check Location",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "images/map.png",
  );
  Items item3 = new Items(
    title: "QR Code",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "images/qr-code.png",
  );
  Items item4 = new Items(
    title: "Return Book",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "images/return-book.png",
  );
  Items item5 = new Items(
    title: "Borrow Book",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "images/borrow-book.png",
  );
  Items item6 = new Items(
    title: "Profile",
    subtitle: "",
    event: "2 Items",
    img: "images/profile.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
                onTap: () {
                  if (data.title == "Manage Book") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }else if(data.title == "Profile"){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageBorrowScreen()),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.circular(10)),
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
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.subtitle,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white38,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.event,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                                fontWeight: FontWeight.w600)),
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