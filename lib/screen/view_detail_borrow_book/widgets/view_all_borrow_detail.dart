import 'package:flutter/material.dart';
import 'package:user_library/models/borrow_detail.dart';

import 'borrow_detail_item.dart';

class ViewAllBorrowDetail extends StatefulWidget {
  final List borrowDetails;
  const ViewAllBorrowDetail({
    this.borrowDetails,
  });
  @override
  _ViewAllBorrowDetailState createState() => _ViewAllBorrowDetailState();
}

class _ViewAllBorrowDetailState extends State<ViewAllBorrowDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.widget.borrowDetails == null
          ? null
          : SingleChildScrollView(
            child: Column(
              children: [
                for (BorrowDetail dto in this.widget.borrowDetails.reversed)
                  BorrowDetailItem(
                    dto: dto,
                  ),
              ],
            ),
          )         
    );
  }
}