import 'package:flutter/material.dart';

void PopupFeedback(
    String title, int hint, BuildContext context, Function callback) {
  // flutter defined function

  showDialog(
    context: context,
    builder: (context) {
      // return object of type Dialog
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: new Text("$title"),
          content: Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CheckboxListTile(
                      onChanged: (bool value) {
                        setState(() {
                          hint = -1;
                        });
                        callback(hint);
                      },
                      title: Text("All"),
                      controlAffinity: ListTileControlAffinity.platform,
                      value: hint == -1,
                    ),
                    CheckboxListTile(
                      onChanged: (bool value) {
                        setState(() {
                          hint = 5;
                        });
                        callback(hint);
                      },
                      title: Text("The most active"),
                      controlAffinity: ListTileControlAffinity.platform,
                      value: hint == 5,
                    ),
                    CheckboxListTile(
                      onChanged: (bool value) {
                        setState(() {
                          hint = 1;
                        });
                        callback(hint);
                      },
                      title: Text("The most negative"),
                      controlAffinity: ListTileControlAffinity.platform,
                      value: hint == 1,
                    ),
                    CheckboxListTile(
                      onChanged: (bool value) {
                        setState(() {
                          hint = 0;
                        });
                        callback(hint);
                      },
                      title: Text("Most recent"),
                      controlAffinity: ListTileControlAffinity.platform,
                      value: hint == 0,
                    ),
                  ],
                ),
              ),
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
