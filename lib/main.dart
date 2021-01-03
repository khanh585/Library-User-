import 'package:user_library/constants.dart';
import 'package:user_library/screen/login_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Login_Screen();
  }
}
//  @override
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
