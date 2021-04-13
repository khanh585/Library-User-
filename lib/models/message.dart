class Message {
  int staffId;
  final int patronId;
  final List wishlist;
  Message({this.staffId, this.patronId, this.wishlist});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      staffId: json['StaffId'],
      patronId: json['PatronId'],
      wishlist: json['WishList'],
    );
  }

  toJson() => {"StaffId": staffId, "PatronId": patronId, "WishList": wishlist};
}
