import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/dao/BookDAO.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/home_screen/home_event.dart';
import 'package:user_library/screen/home_screen/home_state.dart';

class HomeBloc implements Bloc {
  var state = HomeState(listSuggestBook: null, listNewestBook: null);
  final eventController = StreamController<HomeEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<HomeState>.broadcast();

  HomeBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchSuggestBook) {
        int customerId = event.customerId;
        List responseSuggest = await BookDAO().fetchSuggestBook(customerId);
        List responseNewest = await BookDAO().fetchNewestBook();
        List<Book> listSuggestBook = responseSuggest;
        List<Book> listNewestBook = responseNewest;
        state = HomeState(
            listSuggestBook: listSuggestBook, listNewestBook: listNewestBook);
        stateController.sink.add(state);
      }
      // else if () {
      //   List response = await BookDAO()
      //       .fetchNewestBook();

      //   state = HomeState(
      //     listNewestBook: listNewestBook,
      //   );
      //   stateController.sink.add(state);
      // }
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
