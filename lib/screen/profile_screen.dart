import 'package:flutter/material.dart';
import 'package:user_library/widgets/profile/profile_body.dart';

import 'main_layout/main_layout.dart';

class Profile_Screen extends StatefulWidget {
  Profile_Screen({Key key}) : super(key: key);

  @override
  _Profile_Screen_ScreenState createState() => _Profile_Screen_ScreenState();
}

class _Profile_Screen_ScreenState extends State<Profile_Screen> {
  final txtName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtBirthDate = TextEditingController();
  final txtPhoneNumber = TextEditingController();
  final txtIdentityId = TextEditingController();

  GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.close_outlined,
            size: 30,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MainLayout();
              },
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.check_outlined,
                size: 30,
              ),
              onPressed: () => {_validate()}),
        ],
        centerTitle: true,
        title: const Text(
          'EDIT PROFILE',
          textAlign: TextAlign.center,
        ),
      ),
      body: Form(
        key: _form,
        child: Profile_Screen_Body(
          txtBirthDate: txtBirthDate,
          txtName: txtName,
          txtEmail: txtEmail,
          txtIdentityId: txtIdentityId,
          txtPhoneNumber: txtPhoneNumber,
        ),
      ),
    );
  }

  Function _validate() {
    // _form.currentState.validate();
    if (_form.currentState.validate()) {
      final snackBar = new SnackBar(
          content: new Text('Updated Successfully!'),
          backgroundColor: Colors.deepPurple[900]);

      // Find the Scaffold in the Widget tree and use it to show a SnackBar!
      Scaffold.of(_form.currentContext).showSnackBar(snackBar);
    }
  }
}
