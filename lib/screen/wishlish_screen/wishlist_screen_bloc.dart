import 'dart:async';
import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/helper/database_helper.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen_event.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen_state.dart';

class WishListScreenBloc implements Bloc {
  var state = WishListScreenState(
    wishlist: [],
    listBorrow: [],
  );
  final eventController = StreamController<WishListScreenEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<WishListScreenState>.broadcast();

  WishListScreenBloc() {
    eventController.stream.listen((event) async {
      if (event is RefreshWishList) {
        await DatabaseHelper.instance.getBookList().then((value) {
          state.wishlist = value;
        });
        if (event.isInit) {
          state.wishlist.forEach((element) {
            if (!state.listBorrow.contains(element.id)) {
              state.listBorrow.add(element.id);
            }
          });
        }
        print(state.wishlist.length);
        print('RUN WishListScreenBloc');
        stateController.sink.add(state);
      } else if (event is AddOrRemoveToListBorrow) {
        if (!state.listBorrow.contains(event.bookID)) {
          state.listBorrow.add(event.bookID);
        } else {
          state.listBorrow.remove(event.bookID);
        }
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
