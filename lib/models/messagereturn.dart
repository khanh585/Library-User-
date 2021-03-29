class MessageReturn {
  int staffId;
  final int customerId;
  final int borrowId;
  MessageReturn({this.staffId, this.customerId, this.borrowId});

  factory MessageReturn.fromJson(Map<String, dynamic> json) {
    return MessageReturn(
      staffId: json['StaffId'],
      customerId: json['CustomerId'],
      borrowId: json['BorrowId'],
    );
  }

  toJson() =>
      {"StaffId": staffId, "CustomerId": customerId, "BorrowId": borrowId};
}
