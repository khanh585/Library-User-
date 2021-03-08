class Message {
  final int staffId;
  final int customerId;
  final List wishlist;
  Message({this.staffId, this.customerId, this.wishlist});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      staffId: json['StaffId'],
      customerId: json['CustomerId'],
      wishlist: json['WishList'],
    );
  }
  Map<String, dynamic> toJson() =>
      {'StaffId': staffId, 'CustomerId': customerId, 'WishList': wishlist};
}
