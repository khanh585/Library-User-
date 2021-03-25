import 'dart:async';
import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/database/database.dart';
import 'package:user_library/models/wishlist.dart';
import 'package:user_library/screen/wishlist_screen_2/wishlist_state.dart';

import 'wishlist_event.dart';

class WishListBloc implements Bloc {
  var state = WishListState(
    wishlist: [],
  );
  final eventController = StreamController<WishListEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<WishListState>.broadcast();

  WishListBloc() {
    eventController.stream.listen((event) async {
      if (event is RefreshWishList) {
        // get data in function was add data in state
        _getAllWishList();
      } else if (event is DeleteToListBorrow) {
        _deleteWishList(event.wish);
        _getAllWishList();
      }
      //else if (event is AddToListBorrow) {
      //   _addWishList(event.wish);
      // }

      stateController.sink.add(state);
    });
  }

  Future<void> _getAllWishList() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final wishlistDao = database.wishListDao;
    await wishlistDao.findAllWishLists().then((value) {
      this.state.wishlist = value;
    });
  }

  // Future<void> _addWishList(WishList wish) async {
  //   final database =
  //       await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //   final wishlistDao = database.wishListDao;
  //   wishlistDao.updateWishList(wish);
  // }

  Future<void> _deleteWishList(WishList wish) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final wishlistDao = database.wishListDao;
    wishlistDao.deleteWishLists(wish);
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
