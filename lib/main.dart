import 'package:user_library/screen/main_layout/main_layout.dart';

import 'package:user_library/service/authenticate.dart';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'widgets/security_layout/authenticate_bloc.dart';
import 'widgets/security_layout/authenticate_event.dart';
import 'widgets/security_layout/authenticate_state.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final AuthenticateBloc authenticateBloc = new AuthenticateBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
          child: StreamBuilder<AuthenticateState>(
              stream: authenticateBloc.stateController.stream,
              initialData: authenticateBloc.state,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.currentUser);
                  if (snapshot.data.currentUser != null) {
                    return MainLayout();
                  } else {
                    // return Login_Screen(handelLogin: this.handelLogin);
                    return MainLayout();
                  }
                }
                return Text("Error");
              })),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }

  Future<void> handelLogin() async {
    await signInWithGoogle()
        .then((value) {
          authenticateBloc.eventController.sink
              .add(Connect(firebaseUser: value));
        })
        .whenComplete(() => print("COMPLETE"))
        .timeout(Duration(seconds: 30));
  }
}
