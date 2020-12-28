
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 56,
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12),
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(-1, -1),
                      )
                    ]),
                alignment: Alignment.center,
                child: IconButton(
                  color: Colors.amber[900],
                  alignment: Alignment.center,
                  onPressed: () {
                    print('book mark');
                  },
                  icon: Icon(Icons.bookmark_outline),
                ),
              ),
              Container(
                width: 315,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(-1, -1),
                      )
                    ]),
                child: FlatButton(
                  height: 55,
                  minWidth: 315,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed: () {
                    print('Borrow Book');
                  },
                  child: Text(
                    'Borrow Book',
                    style: TextStyle(
                        color: Colors.amber[900],
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
