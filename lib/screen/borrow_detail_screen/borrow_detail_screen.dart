import 'package:flutter/material.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_bloc.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_event.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_state.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/borrow_detail_card.dart';
import 'package:user_library/screen/manage_borrow_screen/widgets/circle_profile.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/progress_circle_indicator.dart';
import 'package:user_library/models/borrow_detail.dart';

class BorrowDetailScreen extends StatefulWidget {
  final int customerId;
  final Customer customer;
  const BorrowDetailScreen({this.customerId, this.customer});

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
      appBar: new AppBar(
        backgroundColor: Color(0xfffbfafd),
        shadowColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, opacity: 0.7),
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        leadingWidth: 25,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          "Borrow history",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              letterSpacing: 1),
        ),
      ),
      body: StreamBuilder<BorrowDetailState>(
        stream: borrow_detail_bloc.stateController.stream,
        initialData: borrow_detail_bloc.state,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("Error");

          return Container(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                          CircleProfile(
                            image: this.widget.customer.image,
                            width: 100,
                            height: 100,
                            acceptSize: 20,
                            acceptTop: 10,
                            acceptRight: 5,
                            accepted: false,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            this.widget.customer.name,
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          ProgressCircleIndicator(
                            completedPercentage: 100,
                            radius: 48,
                            fontSize: 18,
                            content: snapshot.data.sumReturn,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Total fee",
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    child: BorrowDetailCard(
                        customer: this.widget.customer,
                        borrowDetail: snapshot.data.borrowDetails,
                        returnDetail: snapshot.data.returnDetails))
              ],
            ),
          );
        },
      ),
    );
  }
}
