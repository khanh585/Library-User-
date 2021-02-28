import 'package:user_library/models/wishlist.dart';

abstract class WishListScreenEvent {}

class RefreshWishList extends WishListScreenEvent {
  RefreshWishList();
}

class AddOrRemoveToListBorrow extends WishListScreenEvent {
  WishList wish;
  AddOrRemoveToListBorrow(this.wish);
}
