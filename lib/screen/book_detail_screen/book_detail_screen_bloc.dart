import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/screen/book_detail_screen/book_detail_screen_event.dart';
import 'package:user_library/screen/book_detail_screen/book_detail_screen_state.dart';

class BookDetailScreenBloc implements Bloc {
  var state = BookDetailScreenState(); // khoi tao gia tri
  final eventController = StreamController<BookDetailScreenEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
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
