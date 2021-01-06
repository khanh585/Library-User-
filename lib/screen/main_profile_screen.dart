import 'package:flutter/material.dart';

class MainProfileScreen extends StatefulWidget {
  const MainProfileScreen({Key key}) : super(key: key);

  @override
  _MainProfileScreenState createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double he = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(250, 252, 251, 1),
            elevation: 0.0,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.format_list_bulleted_rounded,
                    color: Colors.black87,
                    size: 30,
                  ),
                  onPressed: null)
            ],
            title: Row(
              children: [
                Icon(
                  Icons.lock_outlined,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'khanhtrand',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            bottom: PreferredSize(
                child: Container(
                  color: Colors.purple[700],
                  height: 1.0,
                ),
                preferredSize: Size.fromHeight(4.0)),
          ),
          backgroundColor: Color.fromRGBO(250, 252, 251, 1),
          body: Container(
            height: he,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                          // backgroundColor: Color.fromRGBO(123, 53, 186, 1),
                          backgroundImage: AssetImage('images/khannhava.jpg'),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Khanh Tran Dang',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                      Column(
                        children: [
                          Text(
                            '19',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Readed',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '19',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Readed',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '19',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Readed',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    print('khanh');
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  minWidth: wi - 20 * 2,
                  height: 30,
                  child: Container(
                      width: wi - 20 * 2,
                      height: 30,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.purple[400])),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Edit profile',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your categories favorite',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CategoriesProfileItem(
                              onPress: null, child: Icon(Icons.add)),
                          CategoriesProfileItem(
                              onPress: null, child: Icon(Icons.add)),
                          CategoriesProfileItem(
                              onPress: null, child: Icon(Icons.add)),
                          CategoriesProfileItem(
                              onPress: null, child: Icon(Icons.add)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      child: AppBar(
                        backgroundColor: Colors.white,
                        bottom: TabBar(
                          tabs: [
                            Tab(
                              icon: Icon(
                                Icons.menu_book_rounded,
                                color: Colors.black,
                              ),
                            ),
                            Tab(
                              icon: Icon(
                                Icons.bookmark_outline,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 500,
                      child: TabBarView(
                        children: [
                          // first tab bar view widget
                          Container(
                            color: Colors.red[50],
                            child: Wrap(
                              children: [
                                Container(
                                  color: Colors.white,
                                  width: wi / 3 - 4,
                                  height: wi / 3 - 4,
                                  margin: EdgeInsets.all(2),
                                ),
                                Container(
                                  color: Colors.white,
                                  width: wi / 3 - 4,
                                  height: wi / 3 - 4,
                                  margin: EdgeInsets.all(2),
                                ),
                                Container(
                                  color: Colors.white,
                                  width: wi / 3 - 4,
                                  height: wi / 3 - 4,
                                  margin: EdgeInsets.all(2),
                                ),
                                Container(
                                  color: Colors.white,
                                  width: wi / 3 - 4,
                                  height: wi / 3 - 4,
                                  margin: EdgeInsets.all(2),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.pink[100],
                            child: Center(
                              child: Text(
                                'Car',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ProfileTabBar extends StatelessWidget {
//   const ProfileTabBar({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(length: 2, child: Scaffold(appBar: AppBar(elevation: 0,),body: Column(children: [

//     ],),));
//   }
// }

class CategoriesProfileItem extends StatelessWidget {
  const CategoriesProfileItem({
    Key key,
    this.child,
    this.onPress,
  }) : super(key: key);
  final Widget child;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 50,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black87)),
      child: FlatButton(
        height: 50,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(0),
        onPressed: () {
          this.onPress;
          print('add');
        },
        child: this.child,
      ),
    );
  }
}
