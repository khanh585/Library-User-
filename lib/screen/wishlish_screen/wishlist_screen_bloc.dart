import 'dart:async';
import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/database/database.dart';
import 'package:user_library/models/wishlist.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen_state.dart';

import 'wishlist_screen_event.dart';

class WishListScreenBloc implements Bloc {
  var state = WishListScreenState(
    wishlist: [],
  );
  final eventController = StreamController<WishListScreenEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<WishListScreenState>.broadcast();

  WishListScreenBloc() {
    eventController.stream.listen((event) async {
      if (event is RefreshWishList) {
        // get data in function was add data in state
        _getAllWishList();
      } else if (event is AddOrRemoveToListBorrow) {
        _addOrRemoveWishList(event.wish);
      }
      stateController.sink.add(state);
    });
  }

  Future<void> _getAllWishList() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final wishlistDao = database.wishListDao;
    await wishlistDao.findAllWishLists().then((value) {
      this.state.wishlist = value;
      print('-------- ${value.length}');
    });
  }

  Future<void> _addOrRemoveWishList(WishList wish) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final wishlistDao = database.wishListDao;
    wish.isChecked = !wish.isChecked;
    wishlistDao.updateWishList(wish);
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
