import 'package:flutter/material.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_bloc.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_event.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_state.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/borrow_detail_card.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/circle_indicator.dart';
import 'package:user_library/screen/manage_borrow_screen/widgets/circle_profile.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/progress_circle_indicator.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/progress_line_indicator.dart';

class BorrowDetailScreen extends StatefulWidget {
  final int customerId;
  final Customer customer;
  const BorrowDetailScreen({Key key, this.customerId, this.customer})
      : super(key: key);

  @override
  _BorrowDetailState createState() => _BorrowDetailState(customer);
}

class _BorrowDetailState extends State<BorrowDetailScreen> {
  PageController _goalPageController;
  int _goalPageCurrent = 0;
  final borrow_detail_bloc = BorrowDetailBloc();
  Customer customer;
  _BorrowDetailState(this.customer);
  @override
  void initState() {
    super.initState();
    _goalPageController = PageController(viewportFraction: 0.9);
    borrow_detail_bloc.eventController.sink
        .add(FetchBorrowDetailEvent(this.widget.customerId));
  }

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(colors: [
      Color(0xff00a294),
      Color(0xff01d468),
    ]).createShader(Rect.fromLTWH(0, 0, 150, 300));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffbfafd),
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Text(
              this.widget.customer.name,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              this.widget.customer.name,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
      body: StreamBuilder<BorrowDetailState>(
        stream: borrow_detail_bloc.stateController.stream,
        initialData: borrow_detail_bloc.state,
        builder: (context, snapshot) {
          if(snapshot.hasError) return Text("Error");        
          if(snapshot.data.borrowDetails!=null) {
            return BorrowDetailCard(borrowDetail: snapshot.data.borrowDetails);
            // return Column(
            //   children: <Widget>[
            //     Container(
            //       padding: const EdgeInsets.symmetric(vertical: 30),
            //       decoration: BoxDecoration(
            //           color: Color(0xfffbfafd),
            //           borderRadius: BorderRadius.only(
            //             bottomRight: Radius.circular(80),
            //           ),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey[400],
            //               blurRadius: 5,
            //               offset: Offset(0, 5),
            //             ),
            //           ]),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: <Widget>[
            //           Column(
            //             children: <Widget>[
            //               Hero(
            //                 tag: snapshot.data.borrowDetails[1].bookName,
            //                 child: CircleProfile(
            //                   image: 'images/1.png',
            //                   width: 120,
            //                   height: 120,
            //                   acceptSize: 20,
            //                   acceptTop: 10,
            //                   acceptRight: 5,
            //                   accepted: false,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 8,
            //               ),
            //               // widget.user.accepted
            //               //     ? Text(
            //               //         'Accepted!',
            //               //         style: TextStyle(
            //               //             fontWeight: FontWeight.bold,
            //               //             foreground: Paint()..shader = linearGradient),
            //               //       )
            //               //     : Text(
            //               //         'Not Accepted',
            //               //         style: TextStyle(
            //               //             fontWeight: FontWeight.bold,
            //               //             color: Colors.grey[500]),
            //               //       ),
            //             ],
            //           ),
            //           Column(
            //             children: <Widget>[
            //               ProgressCircleIndicator(
            //                 completedPercentage: 50,
            //                 radius: 55,
            //                 fontSize: 30,
            //               ),
            //               SizedBox(
            //                 height: 15,
            //               ),
            //               Text(
            //                 snapshot.data.borrowDetails[1].bookName,
            //                 style: TextStyle(fontSize: 12),
            //               )
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //     // SizedBox(
            //     //   height: 20,
            //     // ),
            //     // Column(
            //     //   children: <Widget>[
            //     //     Container(
            //     //       child: Column(
            //     //         children: [
            //     //           Expanded(
            //     //             flex: 1,
            //     //             child: Column(
            //     //               children: <Widget>[
            //     //                 Padding(
            //     //                   padding: const EdgeInsets.symmetric(
            //     //                       horizontal: 25),
            //     //                   child: Row(
            //     //                     mainAxisAlignment:
            //     //                         MainAxisAlignment.spaceBetween,
            //     //                     children: <Widget>[
            //     //                       Text(
            //     //                         'Personal goals',
            //     //                         style: TextStyle(
            //     //                           fontWeight: FontWeight.bold,
            //     //                           fontSize: 20,
            //     //                         ),
            //     //                       ),
            //     //                       Text(
            //     //                         'See all >',
            //     //                         style: TextStyle(
            //     //                           fontWeight: FontWeight.bold,
            //     //                           color: Colors.grey,
            //     //                         ),
            //     //                       )
            //     //                     ],
            //     //                   ),
            //     //                 ),
            //     //                 SizedBox(
            //     //                   height: 20,
            //     //                 ),
            //     //                 Container(
            //     //                   height: 100,
            //     //                   child: PageView.builder(
            //     //                     controller: _goalPageController,
            //     //                     itemBuilder: (_, index) {
            //     //                       return Container(
            //     //                         margin: const EdgeInsets.symmetric(
            //     //                             horizontal: 5, vertical: 5),
            //     //                         padding: const EdgeInsets.all(20),
            //     //                         decoration: BoxDecoration(
            //     //                             borderRadius:
            //     //                                 BorderRadius.circular(15),
            //     //                             color: Colors.white,
            //     //                             boxShadow: [
            //     //                               BoxShadow(
            //     //                                 color: Colors.grey[400],
            //     //                                 blurRadius: 5,
            //     //                                 offset: Offset(0, 5),
            //     //                               )
            //     //                             ]),
            //     //                         child: Column(
            //     //                           children: <Widget>[
            //     //                             Row(
            //     //                               mainAxisAlignment:
            //     //                                   MainAxisAlignment
            //     //                                       .spaceBetween,
            //     //                               children: <Widget>[
            //     //                                 Text(
            //     //                                   snapshot.data.borrowDetails[1]
            //     //                                       .bookName,
            //     //                                   style: TextStyle(
            //     //                                       fontWeight:
            //     //                                           FontWeight.bold,
            //     //                                       fontSize: 18),
            //     //                                 ),
            //     //                                 Text('3/5')
            //     //                               ],
            //     //                             ),
            //     //                             SizedBox(
            //     //                               height: 15,
            //     //                             ),
            //     //                             ProgressLineIndicator(
            //     //                               completedPercentage:
            //     //                                   (3 / 5 * 100).toInt(),
            //     //                               width: MediaQuery.of(context)
            //     //                                       .size
            //     //                                       .width *
            //     //                                   0.8,
            //     //                               strokeWidth: 5,
            //     //                             )
            //     //                           ],
            //     //                         ),
            //     //                       );
            //     //                     },
            //     //                     itemCount: 4,
            //     //                     onPageChanged: (page) {
            //     //                       setState(() {
            //     //                         _goalPageCurrent = page;
            //     //                       });
            //     //                     },
            //     //                   ),
            //     //                 ),
            //     //                 SizedBox(
            //     //                   height: 5,
            //     //                 ),
            //     //                 CircleIndicator(
            //     //                   count: 4,
            //     //                   current: _goalPageCurrent,
            //     //                 )
            //     //               ],
            //     //             ),
            //     //           ),
            //     //           Expanded(
            //     //             flex: 2,
            //     //             child: Column(
            //     //               children: <Widget>[
            //     //                 Padding(
            //     //                   padding: const EdgeInsets.symmetric(
            //     //                       horizontal: 25),
            //     //                   child: Row(
            //     //                     mainAxisAlignment:
            //     //                         MainAxisAlignment.spaceBetween,
            //     //                     children: <Widget>[
            //     //                       Text(
            //     //                         'Current tasks',
            //     //                         style: TextStyle(
            //     //                           fontWeight: FontWeight.bold,
            //     //                           fontSize: 20,
            //     //                         ),
            //     //                       ),
            //     //                       Text(
            //     //                         'Calendar >',
            //     //                         style: TextStyle(
            //     //                           fontWeight: FontWeight.bold,
            //     //                           color: Colors.grey,
            //     //                         ),
            //     //                       )
            //     //                     ],
            //     //                   ),
            //     //                 ),
            //     //                 SizedBox(
            //     //                   height: 20,
            //     //                 ),
            //     //                 Container(
            //     //                   height: 180,
            //     //                   child: PageView.builder(
            //     //                     controller: _goalPageController,
            //     //                     itemBuilder: (_, index) {
            //     //                       return Container(
            //     //                         margin: const EdgeInsets.symmetric(
            //     //                             horizontal: 5, vertical: 5),
            //     //                         padding: const EdgeInsets.all(20),
            //     //                         decoration: BoxDecoration(
            //     //                             borderRadius:
            //     //                                 BorderRadius.circular(15),
            //     //                             color: Colors.white,
            //     //                             boxShadow: [
            //     //                               BoxShadow(
            //     //                                 color: Colors.grey[400],
            //     //                                 blurRadius: 5,
            //     //                                 offset: Offset(0, 5),
            //     //                               )
            //     //                             ]),
            //     //                         child: Column(
            //     //                           crossAxisAlignment:
            //     //                               CrossAxisAlignment.start,
            //     //                           children: <Widget>[
            //     //                             Row(
            //     //                               children: <Widget>[
            //     //                                 Container(
            //     //                                   decoration: BoxDecoration(
            //     //                                     borderRadius:
            //     //                                         BorderRadius.circular(
            //     //                                             80),
            //     //                                     color: Colors.greenAccent,
            //     //                                   ),
            //     //                                   child: Icon(
            //     //                                     Icons.arrow_upward,
            //     //                                     color: Colors.green,
            //     //                                     size: 18,
            //     //                                   ),
            //     //                                 ),
            //     //                                 SizedBox(
            //     //                                   width: 5,
            //     //                                 ),
            //     //                                 Text(
            //     //                                   snapshot.data.borrowDetails[1]
            //     //                                       .bookName,
            //     //                                   style: TextStyle(
            //     //                                     fontWeight: FontWeight.bold,
            //     //                                     fontSize: 15,
            //     //                                   ),
            //     //                                 ),
            //     //                                 Expanded(
            //     //                                   child: Container(),
            //     //                                 ),
            //     //                                 Container(
            //     //                                   padding:
            //     //                                       const EdgeInsets.all(5),
            //     //                                   decoration: BoxDecoration(
            //     //                                     borderRadius:
            //     //                                         BorderRadius.circular(
            //     //                                             8),
            //     //                                     color: Colors.grey[300],
            //     //                                   ),
            //     //                                   child: Text(
            //     //                                     'In progress',
            //     //                                     style: TextStyle(
            //     //                                       color: Colors.black87,
            //     //                                       fontWeight:
            //     //                                           FontWeight.bold,
            //     //                                     ),
            //     //                                   ),
            //     //                                 ),
            //     //                               ],
            //     //                             ),
            //     //                             SizedBox(
            //     //                               height: 15,
            //     //                             ),
            //     //                             Text(
            //     //                               snapshot.data.borrowDetails[1]
            //     //                                   .bookName,
            //     //                               style: TextStyle(
            //     //                                   fontWeight: FontWeight.bold,
            //     //                                   fontSize: 20),
            //     //                             ),
            //     //                             Expanded(
            //     //                               child: Container(),
            //     //                             ),
            //     //                             Row(
            //     //                               children: <Widget>[
            //     //                                 Icon(
            //     //                                   Icons.watch_later,
            //     //                                   color: Colors.grey,
            //     //                                   size: 15,
            //     //                                 ),
            //     //                                 Text(
            //     //                                   snapshot.data.borrowDetails[1]
            //     //                                       .bookName,
            //     //                                   style:
            //     //                                       TextStyle(fontSize: 12),
            //     //                                 ),
            //     //                                 Expanded(
            //     //                                   child: Container(),
            //     //                                 ),
            //     //                                 Text(
            //     //                                   snapshot.data.borrowDetails[1]
            //     //                                       .bookName,
            //     //                                   style:
            //     //                                       TextStyle(fontSize: 12),
            //     //                                 )
            //     //                               ],
            //     //                             )
            //     //                           ],
            //     //                         ),
            //     //                       );
            //     //                     },
            //     //                     itemCount: 5,
            //     //                     onPageChanged: (page) {
            //     //                       setState(() {
            //     //                         _goalPageCurrent = page;
            //     //                       });
            //     //                     },
            //     //                   ),
            //     //                 ),
            //     //                 SizedBox(
            //     //                   height: 5,
            //     //                 ),
            //     //                 CircleIndicator(
            //     //                   count: 5,
            //     //                   current: _goalPageCurrent,
            //     //                 )
            //     //               ],
            //     //             ),
            //     //           )
            //     //         ],
            //     //       ),
            //     //     )
            //     //   ],
            //     // )
            //   ],
            // );
          }
          ;
        },
      ),
    );
  }
}
