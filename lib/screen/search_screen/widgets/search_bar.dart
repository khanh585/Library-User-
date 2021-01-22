import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'filter_popup.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    this.onSearch,
  });

  final Function(String, String) onSearch;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String hint = 'name';

  TextEditingController txtSearch;

  void searchBy(String searchValue) {
    if (hint == 'name') {
      this.widget.onSearch(searchValue, '');
    } else {
      this.widget.onSearch('', searchValue);
    }
  }

  void pickSearchBy() {
    FilterPopup(hint, context, fixTextBox);
  }

  void fixTextBox(String txt) {
    setState(() {
      hint = txt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
      height: 40,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(1, 0),
        )
      ], borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                        color: Colors.white,
                      ),
                      child: FlatButton(
                          onPressed: () {
                            //xu ly neu search ko ra
                            String txt =
                                txtSearch != null ? txtSearch.text : '';
                            searchBy(txt);
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )))),
              Expanded(
                flex: 8,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    controller: txtSearch,
                    onSubmitted: (value) {
                      searchBy(value);
                    },
                    style: TextStyle(fontSize: 14, height: 0.4),
                    decoration: InputDecoration(
                        hintText: 'Search by ${hint}',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      color: Colors.white,
                    ),
                    child: FlatButton(
                        onPressed: () {
                          pickSearchBy();
                        },
                        child: Icon(
                          Icons.ballot_outlined,
                          color: Colors.black,
                        ))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
