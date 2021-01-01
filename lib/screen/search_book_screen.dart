import 'package:flutter/material.dart';
import 'package:user_library/dto/categoryDTO.dart';
import 'package:user_library/widget/bottombar.dart';
import 'package:user_library/widget/book_grid.dart';
import 'package:user_library/widget/category_bar.dart';
import 'package:user_library/widget/searchbar.dart';

class SearchBook_Screen extends StatefulWidget {
  SearchBook_Screen({Key key, this.catID}) : super(key: key);
  final int catID;

  @override
  _SearchBook_ScreenState createState() => _SearchBook_ScreenState();
}

class _SearchBook_ScreenState extends State<SearchBook_Screen> {
  final txtSearch = TextEditingController();
  List<CategoryDTO> cats = [
    CategoryDTO(1, "Design"),
    CategoryDTO(2, "Commic"),
    CategoryDTO(3, "Architec"),
    CategoryDTO(4, "Art"),
    CategoryDTO(5, "Computer"),
  ];

  @override
  void initState() {
    if (this.widget.catID != null) {
      print(this.widget.catID);
      cats.forEach((element) {
        if (element.id == this.widget.catID) {
          element.name += '*';
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 252, 251, 1),
        elevation: 0.0,
        title: Text('Search Book'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF545D68),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color.fromRGBO(250, 252, 251, 1),
      body: Stack(children: [
        CategoryBar(
          cats: cats,
        ),

        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 70, left: 5, right: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(147, 149, 148, .7),
                blurRadius: 20,
                offset: Offset(1, 5),
              ),
            ],
          ),
          child: Container(
            child: Column(
              children: [
                // thanh tim kiem
                SearchBar(
                  txtSearch: txtSearch,
                  atHomePage: false,
                ),
                // list book, grid book
                Container(
                  height: MediaQuery.of(context).size.height - 230,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return ProductGrid();
                      }),
                ),
              ],
            ),
          ),
        ),

        Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height - 130),
            child: BottomBar()),
        // Book image
      ]),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20, left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Color.fromRGBO(44, 209, 172, 1),
              child: Icon(Icons.qr_code),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
