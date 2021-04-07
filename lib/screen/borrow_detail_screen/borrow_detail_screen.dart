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
import 'package:user_library/widgets/loading_circle.dart';

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
        .add(FetchBorrowDetailEvent(this.widget.customer.id));
  }

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(colors: [
      Color(0xffff8a65),
      Color(0xffff5722),
    ]).createShader(Rect.fromLTWH(0, 0, 150, 300));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffbfafd),
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Text(
              widget.customer.name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              //style: Theme.of(context).appBarTheme.textTheme.title,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.customer.email,
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
      ),
      body: StreamBuilder<BorrowDetailState>(
        stream: borrow_detail_bloc.stateController.stream,
        initialData: borrow_detail_bloc.state,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("Error");
          if (snapshot.data.borrowDetails.length != 0) {
            //return BorrowDetailCard(borrowDetail: snapshot.data.borrowDetails);
            return Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                        color: Color(0xfffbfafd),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(80),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Hero(
                              tag: snapshot.data.borrowDetails[1].bookName,
                              child: CircleProfile(
                                image: this.widget.customer.image,
                                width: 120,
                                height: 120,
                                acceptSize: 20,
                                acceptTop: 10,
                                acceptRight: 5,
                                accepted: false,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ProgressCircleIndicator(
                              completedPercentage: 100,
                              radius: 55,
                              fontSize: 30,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              this.widget.customer.name,
                              overflow: TextOverflow.fade,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: BorrowDetailCard(
                          customer: this.widget.customer,
                          borrowDetail: snapshot.data.borrowDetails,
                          returnDetail: snapshot.data.returnDetails))
                ],
              ),
            );
          } else {
            return Center(
              child: Stack(
                children: [
                  Image.asset(
                    "images/drone2.gif",
                    height: 250.0,
                    width: 250.0,
                  ),
                  Positioned(
                    child: Text(
                      "Loading",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.orangeAccent[400]),
                    ),
                    top: 200,
                    left: 92,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
