import 'package:flutter/material.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_bloc.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_event.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_state.dart';
import 'package:user_library/screen/manage_borrow_screen/widgets/user_card.dart';


class ManageBorrowScreen extends StatefulWidget {
  const ManageBorrowScreen({Key key}) : super(key: key);

  @override
  _ManageBorrowState createState() => _ManageBorrowState();
}

class _ManageBorrowState extends State<ManageBorrowScreen> {

  final manage_borrow_bloc = ManageBorrowBloc();
  @override
  void initState() {
    super.initState();
    manage_borrow_bloc.eventController.sink
        .add(FetchUser());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF9966).withOpacity(1),
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Text(
                'Newest borrow request',
                //style: Theme.of(context).appBarTheme.textTheme.subtitle1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Swipe right to see details',
                //style: Theme.of(context).appBarTheme.textTheme.subtitle1,
              )
            ],
          ),
        ),
        body: StreamBuilder<ManageBorrowState>(        
          stream: manage_borrow_bloc.stateController.stream,
          initialData: manage_borrow_bloc.state,
          builder: (context, snapshot){
            if (snapshot.hasError) return Text("Error");
            if (snapshot.data.listUser != null) {
              return UserCard(
                customer: snapshot.data.listUser,
              );
            }
          })
        );
  }
}