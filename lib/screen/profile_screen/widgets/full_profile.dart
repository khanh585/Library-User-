import 'package:flutter/material.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/screen/profile_screen/widgets/body_profile.dart';
import 'package:user_library/screen/profile_screen/widgets/header_profile.dart';

class FullProfile extends StatefulWidget {
  final Customer customer;
  const FullProfile({
    this.customer,
  });
  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<FullProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: this.widget.customer == null
            ? null
            : SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderProfile(dto: this.widget.customer),
                    Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    BodyProfile(dto: this.widget.customer),
                  ],
                ),
              ));
  }
}
