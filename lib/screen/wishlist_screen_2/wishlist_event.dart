import 'package:user_library/models/wishlist.dart';

abstract class WishListEvent {}

class RefreshWishList extends WishListEvent {
  RefreshWishList();
}

class AddToListBorrow extends WishListEvent {
  WishList wish;
  AddToListBorrow(this.wish);
}

class DeleteToListBorrow extends WishListEvent {
  WishList wish;
  DeleteToListBorrow(this.wish);
}
