import 'dart:ui';

import 'package:flutter/material.dart';

void FilterPopup(String hint, BuildContext context, Function callback) {
  // flutter defined function

  showDialog(
    context: context,
    builder: (context) {
      // return object of type Dialog
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: new Text(
            "Filter by",
            style: TextStyle(fontSize: 16),
          ),
          content: Container(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CheckboxListTile(
                  onChanged: (bool value) {
                    setState(() {
                      hint = 'name';
                    });
                    callback(hint);
                  },
                  title: Text("Book's Name"),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: hint == 'name',
                ),
                CheckboxListTile(
                  onChanged: (bool value) {
                    setState(() {
                      hint = 'author';
                    });
                    callback(hint);
                  },
                  title: Text("Author"),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: hint != 'name',
                ),
                FlatButton(
                  child: new Text(
                    "Close",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}
