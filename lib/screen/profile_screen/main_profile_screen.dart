import 'package:flutter/material.dart';
import 'package:user_library/screen/welcome_screen/welcome_screen.dart';

import 'package:user_library/widgets/animation/fade_side_up.dart';
import 'package:user_library/widgets/loading_circle.dart';

import 'main_profile_bloc.dart';
import 'main_profile_event.dart';
import 'main_profile_state.dart';
import 'widgets/body_profile.dart';
import 'widgets/header_profile.dart';

class MainProfileScreen extends StatefulWidget {
  final int customerId;
  final int roleId;
  const MainProfileScreen({Key key, this.customerId, this.roleId})
      : super(key: key);

  @override
  _MainProfileScreenState createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  final txtSearch = TextEditingController();

  final main_profile_bloc = MainProfileBloc();
  @override
  void initState() {
    super.initState();
    main_profile_bloc.eventController.sink.add(GetProfileFromToken());
  }

  Future<void> _logout() async {
    await main_profile_bloc.eventController.sink.add(Logout());
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            StreamBuilder<MainProfileState>(
                stream: main_profile_bloc.stateController.stream,
                initialData: main_profile_bloc.state,
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text("Error");
                  if (snapshot.data.mainProfile != null) {
                    return FadeSideUp(
                        1,
                        Wrap(children: [
                          HeaderProfile(tmpUser: snapshot.data.mainProfile),
                          BodyProfile(
                            tmpUser: snapshot.data.mainProfile,
                            logout: _logout,
                          ),
                        ]));
                  } else
                    return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: LoadingCircle(60, Colors.amber));
                }),
          ],
        ),
      ),
    );
  }
}
