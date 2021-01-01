import 'package:flutter/material.dart';
import 'package:user_library/screen/search_book_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    this.txtSearch,
    this.atHomePage,
  }) : super(key: key);

  final TextEditingController txtSearch;
  final bool atHomePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 0),
        )
      ], borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    color: Colors.white,
                  ),
                  child: FlatButton(
                      onPressed: () {
                        //xu ly neu search ko ra
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
                  },
                  decoration: InputDecoration(
                      hintText: 'search by name, author, ...',
                      border: InputBorder.none),
                ),
              ),
              Container(
                  width: 50,
                  decoration: atHomePage
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
                        //xu ly neu search ko ra
                      },
                      child: Icon(
                        Icons.ballot_outlined,
                        color: atHomePage ? Colors.white : Colors.grey,
                      ))),
            ],
          ),
          atHomePage
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchBook_Screen()),
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
