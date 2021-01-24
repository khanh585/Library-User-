import 'package:flutter/material.dart';
import 'package:user_library/screen/profile_screen/widgets/full_profile.dart';

import 'main_profile_bloc.dart';
import 'main_profile_event.dart';
import 'main_profile_state.dart';
import 'widgets/header_profile.dart';

class MainProfileScreen extends StatefulWidget {
  final int customerId;
  const MainProfileScreen({Key key, this.customerId}) : super(key: key);

  @override
  _MainProfileScreenState createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  final txtSearch = TextEditingController();

  final main_profile_bloc = MainProfileBloc();
  @override
  void initState() {
    super.initState();
    main_profile_bloc.eventController.sink.add(FetchMainProfileEvent(this.widget.customerId));
  }


  @override
  Widget build(BuildContext context) {
    double he = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;
    return Scaffold(
            appBar: AppBar(      
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 28),
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
        height: he,
        width: wi,
        child: Column(
          children: [
            Container(
                height: he - 143,
                child: StreamBuilder<MainProfileState>(
                  stream: main_profile_bloc.stateController.stream,
                  initialData: main_profile_bloc.state,
                  builder: (context, snapshot){
                    if(snapshot.hasError) return Text("Error");
                    return FullProfile(
                     customer : snapshot.data.mainProfile,
                    );
                  }
                )
                ),
          ],
        ),
      ),
    );
  }
}
