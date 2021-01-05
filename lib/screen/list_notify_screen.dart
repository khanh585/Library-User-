// import 'package:flutter/material.dart';
// import 'package:user_library/widget/bottombar_2.dart';
// import 'package:user_library/widget/notification_content.dart';
// import 'package:user_library/widget/notify_type.dart';

// class ListNotication_Screen extends StatefulWidget {
//   ListNotication_Screen({Key key}) : super(key: key);

//   @override
//   _ListNotication_ScreenState createState() => _ListNotication_ScreenState();
// }

// class _ListNotication_ScreenState extends State<ListNotication_Screen> {
//   @override
//   Widget build(BuildContext context) {
//     final wi = MediaQuery.of(context).size.width - 10 * 2;
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.only(top: 40, left: 10, right: 10),
//         width: wi,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           children: [
//             Container(
//               height: 90,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Notification',
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
//                   ),
//                   Container(
//                     width: wi,
//                     height: 50,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         NotifiType(
//                           color: Colors.grey,
//                           text: 'All',
//                         ),
//                         NotifiType(
//                           color: Colors.red,
//                           text: 'Danger',
//                         ),
//                         NotifiType(
//                           color: Colors.green,
//                           text: 'Success',
//                         ),
//                         NotifiType(
//                           color: Colors.orange,
//                           text: 'Warning',
//                         ),
//                         NotifiType(
//                           color: Colors.blue,
//                           text: 'Blue',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height - 80 - 50 - 50,
//               child: ListView(
//                 children: [
//                   NotifiContent(
//                     color: Colors.red,
//                     time: '22/12/2020',
//                     from: 'Library',
//                     title: 'Remind return book',
//                     content:
//                         'Hé lô cả nhà, nai dẫn cả nhà đi kiếm Tới nơi dòi..chạy tới phạm ngọc thạch ',
//                   ),
//                   NotifiContent(
//                     color: Colors.green,
//                     time: '22/12/2020',
//                     from: 'Library',
//                     title: 'Remind return book',
//                     content:
//                         'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
//                   ),
//                   NotifiContent(
//                     color: Colors.green,
//                     time: '22/12/2020',
//                     from: 'Library',
//                     title: 'Remind return book',
//                     content:
//                         'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
//                   ),
//                   NotifiContent(
//                     color: Colors.blue,
//                     time: '22/12/2020',
//                     from: 'Library',
//                     title: 'Remind return book',
//                     content:
//                         'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
//                   ),
//                   NotifiContent(
//                     color: Colors.orange,
//                     time: '22/12/2020',
//                     from: 'Library',
//                     title: 'Remind return book',
//                     content:
//                         'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
//                   ),
//                   NotifiContent(
//                     color: Colors.green,
//                     time: '22/12/2020',
//                     from: 'Library',
//                     title: 'Remind return book',
//                     content:
//                         'Hé lô cả nhà, nai dẫn cả nhà đi kiếm chỗ hẹn hò dới đám bạn đồng môn nghen.. Tới nơi dòi..chạy tới phạm ngọc thạch ',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomBar_Home(),
//     );
//   }
// }
