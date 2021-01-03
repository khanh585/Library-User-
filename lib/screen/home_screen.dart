import 'package:flutter/material.dart';
import 'package:user_library/screen/book_detail_screen.dart';
import 'package:user_library/widget/bottombar_2.dart';
import 'package:user_library/widget/category_of_book_button.dart';
import 'package:user_library/widget/home/midle_bar.dart';
import 'package:user_library/widget/list_category_button.dart';
import 'package:user_library/widget/searchbar.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({Key key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              child: SearchBar(atHomePage: true),
            ),
            TopBar(),
            Container(
              width: MediaQuery.of(context).size.width - 15,
              height: 285,
              margin: EdgeInsets.only(top: 25, left: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(1, 0),
                    )
                  ]),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10, left: 15),
                    child: Text(
                      'Suggest for you',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      height: 220,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SuggestBookItem(),
                          SuggestBookItem(),
                          SuggestBookItem(),
                          SuggestBookItem(),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 15 * 2,
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  MidleBar(
                    callback: null,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        ItemBookBottom(),
                        ItemBookBottom(),
                        ItemBookBottom(),
                        ItemBookBottom(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar_Home(),
    );
  }
}

class ItemBookBottom extends StatelessWidget {
  const ItemBookBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetail_Screen()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Container(
              width: 120,
              child: Image.asset(
                'images/notebook.png',
                fit: BoxFit.fill,
                alignment: Alignment.topLeft,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 15 * 2 - 120 - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Author',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '5',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.chrome_reader_mode,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '200',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    width: 300,
                    height: 30,
                    child: ListView_CategoryOfBook(
                      categoies: [
                        'Design',
                        'Architec',
                        'Science',
                        'Comic',
                        'Fashion',
                        'Novel'
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 50,
              alignment: Alignment.topCenter,
              child: IconButton(
                onPressed: () {
                  print('book mark');
                },
                icon: Icon(Icons.bookmark_outline),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SuggestBookItem extends StatelessWidget {
  const SuggestBookItem({
    Key key,
    this.image,
    this.author,
    this.name,
  }) : super(key: key);
  final String image;
  final String author;
  final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetail_Screen()),
        );
      },
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              width: 160,
              child: Image.asset(
                'images/notebook.png',
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Author',
                    style: TextStyle(
                        color: Colors.black12.withOpacity(0.4),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Book Name',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15 * 2,
      height: 55,
      margin: EdgeInsets.only(top: 12, left: 15, right: 15),
      padding: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(1, 0),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              print('QR');
            },
            child: ItemTopBarHomePage(
              icon: Icons.qr_code_outlined,
              text: 'QR-code',
            ),
          ),
          Container(
            height: 30,
            width: 1,
            color: Colors.grey[200],
          ),
          FlatButton(
            onPressed: () {
              print('Mark');
            },
            padding: EdgeInsets.all(0),
            child: ItemTopBarHomePage(
              icon: Icons.bookmark_border_outlined,
              text: 'Mark',
            ),
          ),
          Container(
            height: 30,
            width: 1,
            color: Colors.grey[200],
          ),
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              print('Borrow');
            },
            child: ItemTopBarHomePage(
              icon: Icons.library_books_outlined,
              text: 'Borrow',
            ),
          ),
        ],
      ),
    );
  }
}

class ItemTopBarHomePage extends StatelessWidget {
  final String text;
  final IconData icon;
  const ItemTopBarHomePage({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: null,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.orange,
              size: 25,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
