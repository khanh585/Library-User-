import 'package:flutter/material.dart';
import 'package:user_library/widget/bottombar_2.dart';
import 'package:user_library/widget/notification_content.dart';
import 'package:user_library/widget/notify_type.dart';

class History_Screen extends StatefulWidget {
  History_Screen({Key key}) : super(key: key);

  @override
  _History_ScreenState createState() => _History_ScreenState();
}

class _History_ScreenState extends State<History_Screen> {
  @override
  Widget build(BuildContext context) {
    final wi = MediaQuery.of(context).size.width - 10 * 2;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            null;
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: Text('History',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w400)),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        width: wi,
        height: MediaQuery.of(context).size.height - 30,
        child: Column(
          children: [
            Container(
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: wi,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        NotifiType(
                          color: Colors.grey,
                          text: 'All',
                        ),
                        NotifiType(
                          color: Colors.green,
                          text: 'Success',
                        ),
                        NotifiType(
                          color: Colors.amber,
                          text: 'Processing',
                        ),
                        NotifiType(
                          color: Colors.red,
                          text: 'Danger',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 80 - 80 - 50,
              child: ListView(
                children: [
                  NotifiContent(
                    status: 'success',
                    time: '22/12/2020',
                    title: 'Borrow',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm Tới nơi dòi..chạy tới phạm ngọc thạch ',
                  ),
                  NotifiContent(
                    status: 'warning',
                    time: '22/12/2020',
                    title: 'Borrow',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm Tới nơi dòi..chạy tới phạm ngọc thạch ',
                  ),
                  NotifiContent(
                    status: 'processing',
                    time: '22/12/2020',
                    title: 'Borrow',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm Tới nơi dòi..chạy tới phạm ngọc thạch ',
                  ),
                  NotifiContent(
                    status: 'success',
                    time: '22/12/2020',
                    title: 'Borrow',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm Tới nơi dòi..chạy tới phạm ngọc thạch ',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar_Home(),
    );
  }
}
