import 'package:flutter/material.dart';

class See_Borrow_Detail_Screen extends StatefulWidget {
  See_Borrow_Detail_Screen({Key key}) : super(key: key);

  @override
  _See_Borrow_Detail_ScreenState createState() =>
      _See_Borrow_Detail_ScreenState();
}

class _See_Borrow_Detail_ScreenState
    extends State<See_Borrow_Detail_Screen> {
  final txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              print('cancel');
            },
            child: Icon(
              Icons.delete_forever,
              color: Color(0xFF545D68),
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.purple,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF545D68),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Color.fromRGBO(246, 246, 246, 1)),
        height: he,
        width: wi,
        child: Column(
          children: [
            Container(
                height: he - 143,
                margin: EdgeInsets.only(top: 5),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        CartItem(wi: wi),
                        CartItem(wi: wi),
                        CartItem(wi: wi),
                        CartItem(wi: wi),
                        CartItem(wi: wi),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
    @required this.wi,
  }) : super(key: key);

  final double wi;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        width: wi - 15 * 2,
        height: 270,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: wi - 30 * 2 - 80 - 60,
                  padding: EdgeInsets.only(left: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Name of book',
                        style: TextStyle(
                            color: Color.fromRGBO(75, 81, 136, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Fee :' + ' \$${1232}',
                          style: TextStyle(
                              color: Color.fromRGBO(80, 80, 170, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Author: Nguyen Thanh Viet',
                        style: TextStyle(
                            color: Color.fromRGBO(80, 80, 170, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Page Number: 171',
                        style: TextStyle(
                            color: Color.fromRGBO(80, 80, 170, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 135,
                  margin:
                      EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                  child: Image.asset(
                    'images/khannhava.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: wi - 30 * 2 - 80 - 60,
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        'Total: ',
                        style: TextStyle(
                            color: Color.fromRGBO(162, 163, 181, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' \$${1232}',
                        style: TextStyle(
                            color: Color.fromRGBO(18, 20, 37, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                      height: 50,
                      width: 130,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: FlatButton(                       
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SearchBook_Screen(
                          //               catID: catID,
                          //             )));
                        },
                        minWidth: 130,
                        height: 53,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30),
                        ),
                        child: Text(
                          'See Details',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
              ],
            ),
          ],
        ));
  }
}
