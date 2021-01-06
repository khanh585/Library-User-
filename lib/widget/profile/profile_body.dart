import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:user_library/constants.dart';
import 'package:user_library/screen/home_screen.dart';

import 'package:user_library/widget/profile/profile_background.dart';
import 'package:user_library/widget/profile/rounded_button.dart';

import 'package:form_validator/form_validator.dart';

class Profile_Screen_Body extends StatefulWidget {
  Profile_Screen_Body(
      {Key key,
      this.txtName,
      this.txtEmail,
      this.txtBirthDate,
      this.txtPhoneNumber,
      this.txtIdentityId})
      : super(key: key);
  final TextEditingController txtName;
  final TextEditingController txtEmail;
  final TextEditingController txtBirthDate;
  final TextEditingController txtPhoneNumber;
  final TextEditingController txtIdentityId;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  _Profile_Body_State createState() => _Profile_Body_State();
}

class _Profile_Body_State extends State<Profile_Screen_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Profile_Background(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: size.height * 0.01),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://scontent.fsgn2-3.fna.fbcdn.net/v/t1.15752-9/136095187_408585673795242_3602683831188098354_n.png?_nc_cat=106&ccb=2&_nc_sid=ae9488&_nc_ohc=EoUlLuFmY6IAX9UTDeR&_nc_ht=scontent.fsgn2-3.fna&oh=848453cd7bde47fcd3a793511e253657&oe=601A7A47',
                ),
                radius: 80.0,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: size.height * 0.05),

              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  validator:
                      ValidationBuilder().minLength(2).maxLength(50).build(),
                  onChanged: (value) => {print(this.widget.txtName.text)},
                  controller: this.widget.txtName,
                  cursorColor: Colors.deepPurple[900],
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  validator: ValidationBuilder()
                      .email()
                      .minLength(12)
                      .maxLength(50)
                      .build(),
                  controller: this.widget.txtEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    // helperText: 'Min length: 12, max length: 50',
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  validator:
                      ValidationBuilder().minLength(10).maxLength(10).build(),
                  controller: this.widget.txtBirthDate,
                  decoration: InputDecoration(
                    labelText: 'Birth Date',
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  validator: ValidationBuilder().phone().build(),
                  controller: this.widget.txtPhoneNumber,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  validator:
                      ValidationBuilder().minLength(9).maxLength(12).build(),
                  controller: this.widget.txtIdentityId,
                  decoration: InputDecoration(
                    labelText: 'Identity ID',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
