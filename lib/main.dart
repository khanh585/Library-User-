import 'package:user_library/constants.dart';
import 'package:user_library/screen/login_screen.dart';
import 'package:user_library/bloc/category_bloc.dart';
import 'package:user_library/context.dart';
import 'package:user_library/dao/CategoryDAO.dart';
import 'package:user_library/event/category_event.dart';
import 'package:user_library/screen/book_detail_screen.dart';
import 'package:user_library/screen/home_screen.dart';
import 'package:user_library/screen/list_notify_screen.dart';
import 'package:user_library/screen/search_book_screen.dart';
import 'package:user_library/screen/feedback_screen.dart';
import 'package:user_library/screen/wish_list_screen.dart';
import 'package:user_library/screen/qrcode_borrow_book_screen.dart';

import 'bloc/remote_bloc.dart';
import 'dao/BookDAO.dart';
import 'event/remote_event.dart';
import 'state/remote_state.dart';

import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bloc Demo",
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cat_bloc = CategoryBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> fetchCat() async {
    if (contextData['categories'] == null) {
      contextData['categories'] = await CategoryDAO().fetchCategory('');
    }
    if (contextData['books'] == null) {
      contextData['books'] = await BookDAO().fetchBook('', '', -1);
    }
    contextData['customerID'] = 1;
  }

  @override
  Widget build(BuildContext context) {
    // cat_bloc.eventController.sink.add(FetchCategoryEvent());
    fetchCat();

    return Login_Screen();
    // return Feedback_Screen();
  }
}
//   final bloc = RemoteBloc();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder<RemoteState>(
//             // su dung stream builder de lang nghe stream
//             stream: bloc.stateController
//                 .stream, // truyen stream cua state controller vao de lang nghe
//             initialData: bloc.state, //gia tri khoi tao 70
//             builder:
//                 (BuildContext context, AsyncSnapshot<RemoteState> snapshot) {
//               return Text('Volumn is: ${snapshot.data.volume}');
//             }),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () => bloc.eventController.sink.add(IncrementEvent(5)),
//             child: Icon(Icons.volume_up),
//           ),
//           FloatingActionButton(
//             onPressed: () => bloc.eventController.sink.add(DecrementEvent(5)),
//             child: Icon(Icons.volume_down),
//           ),
//           FloatingActionButton(
//             onPressed: () => bloc.eventController.sink.add(MuteEvent()),
//             child: Icon(Icons.volume_mute),
//           )
//         ],
//       ),
//     );
//   }
// }
