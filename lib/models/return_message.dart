class ReturnMessage {
  final int staffId;
  final int customerId;
  final int borrowId;
  ReturnMessage({this.staffId, this.customerId, this.borrowId});

  factory ReturnMessage.fromJson(Map<String, dynamic> json) {
    return ReturnMessage(
        staffId: json['StaffId'],
        customerId: json['CustomerId'],
        borrowId: json['BorrowId']);
  }

  toJson() =>
      {"StaffId": staffId, "CustomerId": customerId, "BorrowId": borrowId};
}
