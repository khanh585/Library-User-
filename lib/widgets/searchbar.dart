import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:user_library/screen/search_book_screen.dart';

import 'popup.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
    this.atHomePage,
    this.onSearch,
  }) : super(key: key);

  final bool atHomePage;
  final Function(String, String) onSearch;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String hint = 'name';

  TextEditingController txtSearch;

  void searchBy(String txt) {
    if (hint == 'name') {
      this.widget.onSearch(txt, '');
    } else {
      this.widget.onSearch('', txt);
    }
  }

  void pickSearchBy() {
    Popup('Search By', hint, context, fixTextBox);
  }

  void fixTextBox(String txt) {
    setState(() {
      hint = txt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(1, 0),
        )
      ], borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    color: Colors.white,
                  ),
                  child: FlatButton(
                      height: 48,
                      onPressed: () {
                        //xu ly neu search ko ra
                        String txt = txtSearch != null ? txtSearch.text : '';
                        searchBy(txt);
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ))),
              Container(
                width:
                    MediaQuery.of(context).size.width - 50 * 2 - 15 * 2 - 5 * 2,
                color: Colors.white,
                child: TextField(
                  controller: txtSearch,
                  onChanged: (value) {
                    //xu ly neu search ko ra
                    searchBy(value);
                  },
                  decoration: InputDecoration(
                      hintText: 'Search by ${hint}', border: InputBorder.none),
                ),
              ),
              Container(
                  width: 50,
                  decoration: widget.atHomePage
                      ? BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          color: Colors.white,
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.grey[300], spreadRadius: 1),
                          ],
                          color: Colors.white,
                        ),
                  child: FlatButton(
                      height: 48,
                      onPressed: () {
                        pickSearchBy();
                      },
                      child: Icon(
                        Icons.ballot_outlined,
                        color: widget.atHomePage ? Colors.white : Colors.grey,
                      ))),
            ],
          ),
          widget.atHomePage
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchBook_Screen(
                                catID: -1,
                              )),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white.withOpacity(0),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
