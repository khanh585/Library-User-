import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/screen/book_detail_screen/book_detail_librarian_event.dart';
import 'package:user_library/screen/book_detail_screen/book_detail_librarian_state.dart';

class BookDetailScreenBloc implements Bloc {
  var state = BookDetailScreenState(); // khoi tao gia tri

  final eventController = StreamController<BookDetailScreenEvent>();
  final stateController = StreamController<BookDetailScreenState>();

  BookDetailScreenBloc() {
    eventController.stream.listen((event) async {
      stateController.sink.add(state);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
