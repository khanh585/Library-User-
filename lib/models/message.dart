class Message {
  final int staffId;
  final int customerId;
  final List<int> wishlist;
  Message({this.staffId, this.customerId, this.wishlist});

  Map<String, dynamic> toJson() =>
      {'StaffId': staffId, 'CustomerId': customerId, 'WishList': wishlist};
}
