import 'dart:async';

import 'package:user_library/dao/BookDAO.dart';
import 'package:user_library/event/book_event.dart';
import 'package:user_library/state/book_state.dart';

import '../context.dart';

class BookBloc {
  var state = BookState(books: contextData['books']); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<BookEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<BookState>();

  BookBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchBookEvent) {
        String name = event.txtName;
        String author = event.txtAuthor;
        int categoryID = event.categoryID;
        List list = await BookDAO().fetchBook(name, author, categoryID);
        state = BookState(books: list);
      }

      stateController.sink.add(state);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
