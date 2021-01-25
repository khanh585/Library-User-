import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/dao/BookDAO.dart';
import 'package:user_library/dao/CategoryDAO.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/models/category.dart';

import 'search_screen_event.dart';
import 'search_screen_state.dart';

class SearchScreenBloc implements Bloc {
  var state = SearchScreenState(
      listCategories: null,
      listBooks: null,
      name: "",
      author: "",
      categoryId: -1);
  final eventController = StreamController<SearchScreenEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<SearchScreenState>.broadcast();

  SearchScreenBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchCategories) {
        List<Category> result = await CategoryDAO().fetchCategory('');
        state.listCategories = result;
        stateController.sink.add(state);
      } else if (event is FetchBooks) {
        String author = event.author;
        String name = event.name;
        int categoryId = event.categoryId;

        List<Book> result = await BookDAO().fetchBook(name, author, categoryId);

        state.listBooks = result;
        state.name = name;
        state.author = author;
        state.categoryId = categoryId;

        stateController.sink.add(state);
      } else if (event is CleanBooks) {
        state.listBooks = null;
        stateController.sink.add(state);
      }
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
