import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/screen/book_detail_screen_2/book_detail_event.dart';
import 'package:user_library/screen/book_detail_screen_2/book_detail_state.dart';

class BookDetailBloc implements Bloc {
  var state = BookDetailState(); // khoi tao gia tri

  final eventController = StreamController<BookDetailEvent>();
  final stateController = StreamController<BookDetailState>();

  BookDetailBloc() {
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
