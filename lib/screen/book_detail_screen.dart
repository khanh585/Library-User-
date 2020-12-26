import 'package:flutter/material.dart';
import 'package:user_library/widget/list_category_button.dart';

class BookDetail_Screen extends StatefulWidget {
  const BookDetail_Screen({Key key}) : super(key: key);

  @override
  _BookDetail_ScreenState createState() => _BookDetail_ScreenState();
}

class _BookDetail_ScreenState extends State<BookDetail_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 20 * 16,
            decoration: new BoxDecoration(
              color: Colors.black,
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: new AssetImage(
                  'images/tinydragon.jpg',
                ),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'images/tinydragon.jpg',
                      fit: BoxFit.contain,
                      width: 160,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The Tiny Dragon',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rubert Carter',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 350,
                    height: 80,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white24.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(2, 1),
                          )
                        ],
                        color: Colors.black45.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Rating',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(height: 40, width: 1, color: Colors.grey),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '180',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Page',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(height: 40, width: 1, color: Colors.grey),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Eng',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Language',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 20 * 14,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(247, 249, 248, 0.7),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(2, 0),
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Text(
                              'Categories',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6)),
                              width: MediaQuery.of(context).size.width -
                                  20 * 2 -
                                  95,
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Train Your Dragon To Love Himself: A Dragon Book To Give Children Positive Affirmations. A Cute Children Story To Teach Kids To Love Who They Are. (My Dragon Books)',
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              height: 150,
                              margin:
                                  EdgeInsets.only(top: 30, left: 20, right: 20),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.black54,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

          AddToCartButton(),
          // Appbar
          AppBar(),
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 55,
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
          Container(
            child: Text(
              'Detail Book',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22),
            ),
          ),
          Container(
            width: 55,
          ),
        ],
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 56,
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12),
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(-1, -1),
                      )
                    ]),
                alignment: Alignment.center,
                child: IconButton(
                  color: Colors.amber[900],
                  alignment: Alignment.center,
                  onPressed: () {
                    print('book mark');
                  },
                  icon: Icon(Icons.bookmark_outline),
                ),
              ),
              Container(
                width: 315,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(-1, -1),
                      )
                    ]),
                child: FlatButton(
                  height: 55,
                  minWidth: 315,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed: () {
                    print('Borrow Book');
                  },
                  child: Text(
                    'Borrow Book',
                    style: TextStyle(
                        color: Colors.amber[900],
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
