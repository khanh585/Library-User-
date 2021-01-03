import 'package:flutter/material.dart';

void Popup(String title, String hint, BuildContext context, Function callback) {
  // flutter defined function

  showDialog(
    context: context,
    builder: (context) {
      // return object of type Dialog
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: new Text("$title"),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
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
                  title: Text("Name of Book"),
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
                  title: Text("Author of Book"),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: hint != 'name',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
    },
  );
}
