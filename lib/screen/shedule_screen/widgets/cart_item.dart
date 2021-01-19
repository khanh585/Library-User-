import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:user_library/dto/ScheduleDTO.dart';

class ViewAllSchedule extends StatefulWidget {
  final List schedules;
  const ViewAllSchedule({
    this.schedules,
  });
  @override
  _ViewAllScheduleState createState() => _ViewAllScheduleState();
}

class _ViewAllScheduleState extends State<ViewAllSchedule> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.widget.schedules == null
          ? null
          : SingleChildScrollView(
            child: Column(
              children: [
                for (ScheduleDTO dto in this.widget.schedules.reversed)
                  CartItem(
                    dto: dto,
                  ),
              ],
            ),
          )         
    );
  }
}
class CartItem extends StatelessWidget {
  final ScheduleDTO dto;
  const CartItem({
    Key key,
    this.dto,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        width: wi - 15 * 2,
        height: 280,
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
                        height: 30,
                      ),
                      Text(
                        this.dto.customerName,
                        style: TextStyle(
                            color: Color.fromRGBO(75, 81, 136, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(this.dto.quantity.toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(80, 80, 170, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Borrow Date : 22-01-2020',
                        style: TextStyle(
                            color: Color.fromRGBO(80, 80, 170, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Return Date : 29-01-2020',
                        style: TextStyle(
                            color: Color.fromRGBO(80, 80, 170, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  margin:
                      EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                  child: Image.asset(
                    'images/tinydragon.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: wi - 30 * 2 - 80 - 60,
                  padding: EdgeInsets.only(left: 15, bottom: 15),
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
