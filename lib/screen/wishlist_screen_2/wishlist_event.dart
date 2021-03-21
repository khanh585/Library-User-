import 'package:user_library/models/wishlist.dart';

abstract class WishListEvent {}

class RefreshWishList extends WishListEvent {
  RefreshWishList();
}

class AddOrRemoveToListBorrow extends WishListEvent {
  WishList wish;
  AddOrRemoveToListBorrow(this.wish);
}
