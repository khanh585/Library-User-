class Obj {
  int StaffId;
  int CustomerId;
  List<int> Wishlist;
  Obj({this.StaffId, this.Wishlist, this.CustomerId});

  Map<String, dynamic> toJson() =>
      {'StaffId': StaffId, 'CustomerId': CustomerId, 'WishList': Wishlist};
}
