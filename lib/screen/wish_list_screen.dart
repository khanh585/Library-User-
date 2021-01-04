import 'package:flutter/material.dart';
import 'package:user_library/widget/wish_list/bag_bar.dart';
import 'package:user_library/widget/wish_list/book_cart.dart';

class WishList_Screen extends StatefulWidget {
  WishList_Screen({Key key}) : super(key: key);

  @override
  _WishList_ScreenState createState() => _WishList_ScreenState();
}

class _WishList_ScreenState extends State<WishList_Screen> {
  final txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black87, fontSize: 28),
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
        backgroundColor: Colors.white,
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
                height: he - 243,
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
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ],
                )),
            Container(
              height: 38,
              width: wi - 60 * 2,
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Quantity: ',
                        style: TextStyle(
                            color: Color.fromRGBO(162, 163, 181, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' ${4}',
                        style: TextStyle(
                            color: Color.fromRGBO(18, 20, 37, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 100,
                width: wi,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 130,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(2),
                      // padding: EdgeInsets.only(top: 2, bottom: 2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: Colors.purple),
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
                        height: 55,
                        minWidth: 130,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Add more',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w600),
                        ),
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
                          'Export QRCode',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)))),
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
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Image.asset(
              'images/tinydragon.jpg',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: wi - 30 * 2 - 80 - 60,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name of book',
                  style: TextStyle(
                      color: Color.fromRGBO(75, 81, 136, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                Text('Author',
                    style: TextStyle(
                        color: Color.fromRGBO(83, 80, 170, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Container(
            height: 90,
            width: 60,
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
