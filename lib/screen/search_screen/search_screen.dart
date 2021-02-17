import 'package:flutter/material.dart';

import 'package:user_library/models/category.dart';
import 'package:user_library/screen/search_screen/search_screen_event.dart';
import 'package:user_library/screen/search_screen/search_screen_state.dart';
import 'package:user_library/screen/search_screen/widgets/book_grid.dart';

import 'package:user_library/screen/search_screen/widgets/category_bar.dart';
import 'package:user_library/widgets/animation/fade_side_up.dart';

import 'package:user_library/widgets/loading_circle.dart';
import 'package:user_library/screen/search_screen/widgets/search_bar.dart';
import 'search_screen_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({this.catID});
  final int catID;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchScreenBloc = SearchScreenBloc();

  @override
  void initState() {
    searchScreenBloc.eventController.sink.add(FetchCategories());
    searchScreenBloc.eventController.sink
        .add(FetchBooks(author: "", name: "", categoryId: -1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 0.0,
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
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: StreamBuilder<SearchScreenState>(
          stream: searchScreenBloc.stateController.stream,
          initialData: searchScreenBloc.state,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text("Error");
            if (snapshot.hasData) {
              List<Category> list = snapshot.data.listCategories;
              if (list != null) {
                return Stack(children: [
                  FadeSideUp(
                      1,
                      CategoryBar(
                        cats: list,
                        searchByCategory: searchBooksByCategory,
                      )),
                  FadeSideUp(
                    2,
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 65, left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(34)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(147, 149, 148, .7),
                            blurRadius: 20,
                            offset: Offset(1, 5),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            // thanh tim kiem
                            Container(
                              child: SearchBar(
                                onSearch: searchBooks,
                              ),
                            ),

                            // list book, grid book
                            Container(
                              height: MediaQuery.of(context).size.height - 212,
                              width: MediaQuery.of(context).size.width,
                              child: StreamBuilder<SearchScreenState>(
                                  stream:
                                      searchScreenBloc.stateController.stream,
                                  initialData: searchScreenBloc.state,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) return Text("Error");
                                    if (snapshot.data.listBooks != null) {
                                      return BookGrid(
                                        listBooks: snapshot.data.listBooks,
                                      );
                                    } else {
                                      return Container(
                                        alignment: Alignment.topCenter,
                                        child: LoadingCircle(
                                            70, Colors.purple[300]),
                                      );
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]);
              } else {
                return Container(
                  child: LoadingCircle(60, Colors.purple[300]),
                );
              }
            }
          }),
    );
  }

  Future<void> searchBooks(String name, String author) {
    searchScreenBloc.eventController.sink.add(CleanBooks());
    searchScreenBloc.eventController.sink.add(FetchBooks(
        author: author,
        name: name,
        categoryId: searchScreenBloc.state.categoryId));
  }

  Future<void> searchBooksByCategory(int categoryID) {
    searchScreenBloc.eventController.sink.add(CleanBooks());
    searchScreenBloc.eventController.sink.add(FetchBooks(
        author: searchScreenBloc.state.author,
        name: searchScreenBloc.state.name,
        categoryId: categoryID));
  }
}
