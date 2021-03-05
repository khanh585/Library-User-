import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/dao/BookDAO.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_event.dart';
import 'package:user_library/screen/home_detail_screen/home_detail_state.dart';


class HomeDetailBloc implements Bloc {
  var state = HomeDetailState(
      listPopularBook: new List<Book>(),listNewestBook: new List<Book>());
  final eventController = StreamController<HomeDetailEvent>();

  final stateController = StreamController<HomeDetailState>.broadcast();

  HomeDetailBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchPopularBook) {
        List responseSuggest = await BookDAO()
            .fetchPopularBook();
        List responseNewest = await BookDAO()
            .fetchNewestBook();
        List<Book> listPopularBook = responseSuggest;
        List<Book> listNewestBook = responseNewest;
        state = HomeDetailState(
          listPopularBook: listPopularBook,
          listNewestBook: listNewestBook
        );
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
