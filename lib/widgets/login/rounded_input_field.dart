import 'package:flutter/material.dart';
import 'package:user_library/widgets/login/text_field_container.dart';

import '../../constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String errorRegex;
  final String errorMes;
  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.controller,
      this.errorRegex,
      this.errorMes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: kPrimaryColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          } else {
            if (errorRegex != null) {
              RegExp regExp = new RegExp(
                errorRegex,
                caseSensitive: false,
                multiLine: false,
              );
              if (!regExp.hasMatch(value)) {
                return errorMes;
              }
            }
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
