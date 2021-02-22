abstract class WishListScreenEvent {}

class RefreshWishList extends WishListScreenEvent {
  bool isInit;
  RefreshWishList(this.isInit);
}

class AddOrRemoveToListBorrow extends WishListScreenEvent {
  int bookID;
  AddOrRemoveToListBorrow(this.bookID);
}
