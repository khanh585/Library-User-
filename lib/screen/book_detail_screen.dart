import 'package:flutter/material.dart';
import 'package:user_library/bloc/Feedback_bloc.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/dto/BookDTO.dart';
import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/screen/feedback_screen.dart';
import 'package:user_library/widgets/app_bar_custom.dart';
import 'package:user_library/widgets/feedback/view_all_feedback.dart';
import 'package:user_library/widgets/list_category_button.dart';

import 'book_detail_screen_copy.dart';

class BookDetail_Screen extends StatefulWidget {
  const BookDetail_Screen({Key key, this.book}) : super(key: key);
  final BookDTO book;
  @override
  _BookDetail_ScreenState createState() => _BookDetail_ScreenState();
}

class _BookDetail_ScreenState extends State<BookDetail_Screen> {
  double rating = 0;
  List<FeedbackDTO> listFeedbacks = [];

  @override
  void initState() {
    subFeedback();
    super.initState();
  }

  void subFeedback() async {
    Map data = await FeedbackDAO().fetchFeedback(this.widget.book.id, -1);
    if (data == null) {
      return;
    }
    data['list'].forEach((FeedbackDTO element) {
      rating += element.rating;
    });
    rating = rating / data['list'].length;
    int le = 2;
    if (le > data['list'].length) {
      le = data['list'].length;
    }
    for (int i = 0; i < le; i++) {
      listFeedbacks.add(data['list'][i]);
    }

    setState(() {
      rating = rating;
      listFeedbacks = listFeedbacks;
    });
  }

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
                  'images/bama.jpg',
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
                      'images/bama.jpg',
                      fit: BoxFit.contain,
                      width: 160,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    this.widget.book.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    this.widget.book.name,
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
                                  this.rating.toStringAsFixed(2),
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
                                  '${this.widget.book.pageNumber}',
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
                        //   Container(height: 40, width: 1, color: Colors.grey),
                        //   Container(
                        //     padding: EdgeInsets.only(left: 30, right: 30),
                        //     child: SizedBox(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text(
                        //             'Eng',
                        //             style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 22,
                        //                 fontWeight: FontWeight.w600),
                        //           ),
                        //           SizedBox(
                        //             height: 5,
                        //           ),
                        //           Text(
                        //             'Language',
                        //             style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 14,
                        //                 fontWeight: FontWeight.w400),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   )
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
                              'Categories:',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6)),
                              width: MediaQuery.of(context).size.width -
                                  20 * 2 -
                                  95,
                              height: 30,
                              child: ListView_CategoryOfBook(
                                categoies: this.widget.book.categories,
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
                              'Description:',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                this.widget.book.description,
                                // 'Train Your Dragon To Love Himself: A Dragon Book To Give Children Positive Affirmations. A Cute Children Story To Teach Kids To Love Who They Are. (My Dragon Books)',
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ViewAllFeedback(
                        listData: this.listFeedbacks,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Feedback_Screen()));
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'View feedback more',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 15),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          AddToCartButton(),
          // Appbar
          AppBarCustom(
            // background: Colors.white,
            back: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            title: Text(
              "Detail",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
