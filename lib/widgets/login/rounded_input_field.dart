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
  final bool isDup;
  const RoundedInputField(
      {this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.controller,
      this.errorRegex,
      this.errorMes,
      this.isDup});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: kPrimaryColor,
        autofocus: true,
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
            if (isDup != null && isDup) {
              return 'Duplicate';
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
