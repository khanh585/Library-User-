import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final int ageAdult;
  final int maxLength;
  final int minLength;
  const RoundedInputField(
      {this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.controller,
      this.errorRegex,
      this.errorMes,
      this.isDup,
      this.maxLength,
      this.minLength,
      this.ageAdult});

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
            if (minLength == null) {
              if (value.trim().length == 0) {
                return 'Required';
              }
            } else {
              if (value.trim().length < minLength) {
                return 'Min charaters is ${minLength}';
              }
            }
            if (maxLength == null) {
              if (value.trim().length > 250) {
                return 'Max charaters is 250';
              }
            } else {
              if (value.trim().length > maxLength) {
                return 'Max charaters is ${maxLength}';
              }
            }
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
            if (ageAdult != null) {
              var now = new DateTime.now();
              var formatter = new DateFormat('y');
              int curYear = int.parse(formatter.format(now));
              int age = curYear - int.parse(value.split('-')[0]);
              if (age < ageAdult) {
                return 'Not enought ${ageAdult} age';
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
