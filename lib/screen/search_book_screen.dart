import 'package:flutter/material.dart';
import 'package:user_library/bloc/book_bloc.dart';
import 'package:user_library/bloc/category_bloc.dart';
import 'package:user_library/context.dart';
import 'package:user_library/dao/BookDAO.dart';
import 'package:user_library/dao/CategoryDAO.dart';
import 'package:user_library/dto/CategoryDTO.dart';
import 'package:user_library/event/book_event.dart';
import 'package:user_library/state/book_state.dart';
import 'package:user_library/widgets/book_grid.dart';
import 'package:user_library/widgets/category_bar.dart';
import 'package:user_library/widgets/searchbar.dart';

class SearchBook_Screen extends StatefulWidget {
  SearchBook_Screen({Key key, this.catID}) : super(key: key);
  final int catID;

  @override
  _SearchBook_ScreenState createState() => _SearchBook_ScreenState();
}

class _SearchBook_ScreenState extends State<SearchBook_Screen> {
  final cat_bloc = CategoryBloc();
  final book_bloc = BookBloc();

  List<CategoryDTO> cats;
  String name, author;
  int categoryID;

  void searchBooks(String name, String author) {
    setState(() {
      this.name = name;
      this.author = author;
    });
    book_bloc.eventController.sink
        .add(FetchBookEvent(name, author, categoryID));
  }

  void searchBooksByCategory(int categoryID) {
    setState(() {
      this.categoryID = categoryID;
    });
    book_bloc.eventController.sink
        .add(FetchBookEvent(this.name, this.author, categoryID));
  }

  Future<void> fetchData() async {
    if (contextData['categories'] == null) {
      contextData['categories'] = await CategoryDAO().fetchCategory('');
    }
    if (contextData['books'] == null) {
      contextData['books'] = await BookDAO().fetchBook('', '', -1);
    }
  }

  @override
  void initState() {
    fetchData();
    this.name = '';
    this.author = '';
    cats = [];
    cats.add(CategoryDTO(id: -1, name: 'All'));
    cats.addAll(contextData['categories']);
    if (this.widget.catID != null) {
      categoryID = this.widget.catID;
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
          searchByCategory: searchBooksByCategory,
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
                  atHomePage: false,
                  onSearch: searchBooks,
                ),
                // list book, grid book
                Container(
                  height: MediaQuery.of(context).size.height - 225,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<BookState>(
                      stream: book_bloc.stateController.stream,
                      initialData: book_bloc.state,
                      builder: (context, snapshot) {
                        return ProductGrid(
                          listBooks: snapshot.data.books,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
