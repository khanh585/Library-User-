import 'package:flutter/material.dart';
import 'package:user_library/widget/bottombar_2.dart';

class ListNotication_Screen extends StatefulWidget {
  ListNotication_Screen({Key key}) : super(key: key);

  @override
  _ListNotication_ScreenState createState() => _ListNotication_ScreenState();
}

class _ListNotication_ScreenState extends State<ListNotication_Screen> {
  @override
  Widget build(BuildContext context) {
    final wi = MediaQuery.of(context).size.width - 10 * 2;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 40, left: 10, right: 10),
        width: wi,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
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
                          color: Colors.red,
                          text: 'Danger',
                        ),
                        NotifiType(
                          color: Colors.green,
                          text: 'Success',
                        ),
                        NotifiType(
                          color: Colors.orange,
                          text: 'Warning',
                        ),
                        NotifiType(
                          color: Colors.blue,
                          text: 'Blue',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 80 - 50 - 50,
              child: ListView(
                children: [
                  NotifiContent(
                    color: Colors.red,
                    time: '22/12/2020',
                    from: 'Library',
                    title: 'Remind return book',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm Tới nơi dòi..chạy tới phạm ngọc thạch ',
                  ),
                  NotifiContent(
                    color: Colors.green,
                    time: '22/12/2020',
                    from: 'Library',
                    title: 'Remind return book',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
                  ),
                  NotifiContent(
                    color: Colors.green,
                    time: '22/12/2020',
                    from: 'Library',
                    title: 'Remind return book',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
                  ),
                  NotifiContent(
                    color: Colors.blue,
                    time: '22/12/2020',
                    from: 'Library',
                    title: 'Remind return book',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
                  ),
                  NotifiContent(
                    color: Colors.orange,
                    time: '22/12/2020',
                    from: 'Library',
                    title: 'Remind return book',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
                  ),
                  NotifiContent(
                    color: Colors.green,
                    time: '22/12/2020',
                    from: 'Library',
                    title: 'Remind return book',
                    content:
                        'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
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

class NotifiType extends StatelessWidget {
  const NotifiType({
    Key key,
    this.color,
    this.text,
  }) : super(key: key);
  final color;
  final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          print(text);
        },
        padding: EdgeInsets.all(0),
        minWidth: 80,
        child: Text(
          text,
          style: TextStyle(color: color[600], fontSize: 16),
        ),
      ),
      height: 40,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 12, right: 15),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: color,
            width: 3.0,
          ),
          bottom: BorderSide(
            color: color,
            width: 1.0,
          ),
          left: BorderSide(
            color: color,
            width: 1.0,
          ),
          right: BorderSide(
            color: color,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

class NotifiContent extends StatelessWidget {
  const NotifiContent({
    Key key,
    this.color,
    this.content,
    this.title,
    this.time,
    this.from,
  }) : super(key: key);
  final color;
  final content;
  final title;
  final time;
  final from;
  @override
  Widget build(BuildContext context) {
    final wi = MediaQuery.of(context).size.width - 10 * 2;
    return Container(
        width: wi,
        padding: EdgeInsets.only(left: 3, top: 5, bottom: 5),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: color,
              width: 10.0,
            ),
            top: BorderSide(
              color: color,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: color,
              width: 1.0,
            ),
            right: BorderSide(
              color: color,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 5),
              width: wi - 92,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        from,
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Text(
                        time,
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(content,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              width: 70,
              height: 80,
              child: FlatButton(
                onPressed: () {
                  print('detail');
                },
                child: Icon(
                  Icons.near_me_outlined,
                  color: color,
                  size: 30,
                ),
              ),
            ),
          ],
        ));
  }
}
