import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:user_library/widget/wish_list/slidable_widget.dart';
import 'package:user_library/widget/utils.dart';

class BookCart extends StatefulWidget {
  final void Function() refresh;
  const BookCart({
    Key key,
    this.refresh,
  }) : super(key: key);
  @override
  _BookCartState createState() => _BookCartState();
}

class _BookCartState extends State<BookCart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      height: MediaQuery.of(context).size.height - 242,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 40),
            child: Text(
              'Review your wishlist',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 51, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'RobotoMono'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 135),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          '\$',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'RobotoMono'),
                        ),
                      ),
                      Text(
                        '16.90',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'RobotoMono'),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
          ),
          SlidableWidget(
            onDismissed: (action) =>
                  dismissSlidableItem(context, 1, action),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(1, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, top: 10, right: 30),
                            child: Image.asset(
                              'images/bama.jpg',
                              fit: BoxFit.contain,
                              width: 80,
                              height: 80,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 20, left: 20, bottom: 10, right: 30),
                            //alignment: AlignmentDirectional.topStart,
                            //alignment: AlignmentDirectional.topCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          200,
                                      child: Text(
                                        'At the Going Down of the Sun',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'RobotoMono'),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10.0),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$4.50',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'RobotoMono'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(1, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10, right: 30),
                          child: Image.asset(
                            'images/tinydragon.jpg',
                            fit: BoxFit.contain,
                            width: 80,
                            height: 80,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 20, left: 20, bottom: 10, right: 30),
                          //alignment: AlignmentDirectional.topStart,
                          //alignment: AlignmentDirectional.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 200,
                                    child: Text(
                                      'A Tiny Dragon',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'RobotoMono'),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10.0),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$4.50',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'RobotoMono'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(1, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10, right: 30),
                          child: Image.asset(
                            'images/gravity.jpg',
                            fit: BoxFit.contain,
                            width: 80,
                            height: 80,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 20, left: 20, bottom: 10, right: 30),
                          //alignment: AlignmentDirectional.topStart,
                          //alignment: AlignmentDirectional.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 200,
                                    child: Text(
                                      'The Gravity of Us',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'RobotoMono'),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10.0),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$4.50',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'RobotoMono'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 10,
              width: 20,
            child: RaisedButton(
            onPressed: () {},
            textColor: Colors.white,  
            padding: const EdgeInsets.all(0.0),
            child: Container(
              
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
          )
            )
          )
        ],
      ),
    );
  }
  void dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    setState(() {
     //
    });

    switch (action) {
      case SlidableAction.delete:
        Utils.showSnackBar(context, 'Chat has been deleted');
        break;
    }
  }
}

