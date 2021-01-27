import 'package:flutter/material.dart';
import 'package:user_library/screen/view_detail_borrow_book/borrow_detail_bloc.dart';
import 'package:user_library/screen/view_detail_borrow_book/borrow_detail_event.dart';

import 'borrow_detail_state.dart';
import 'widgets/view_all_borrow_detail.dart';


class Borrow_Detail_Screen extends StatefulWidget {
  final int borrowId;
  Borrow_Detail_Screen({Key key, this.borrowId}) : super(key: key);

  @override
  _Borrow_Detail_ScreenState createState() =>
      _Borrow_Detail_ScreenState();
}

class _Borrow_Detail_ScreenState
    extends State<Borrow_Detail_Screen> {
  final txtSearch = TextEditingController();

  final borrow_detail_bloc = BorrowDetailBloc();
  @override
  void initState() {
    super.initState();
    borrow_detail_bloc.eventController.sink.add(FetchBorrowDetailEvent(this.widget.borrowId));
  }

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(      
        title: Text(
          'Borrow Detail',
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
                child: StreamBuilder<BorrowDetailState>(
                  stream: borrow_detail_bloc.stateController.stream,
                  initialData: borrow_detail_bloc.state,
                  builder: (context, snapshot){
                    if(snapshot.hasError) return Text("Error");
                    return ViewAllBorrowDetail(
                      borrowDetails: snapshot.data.borrowDetails,
                    );
                  }
                )),
          ],
        ),
      ),
    );
  }
}
