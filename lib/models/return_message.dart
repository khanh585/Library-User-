class ReturnMessage {
  final int staffId;
  final int customerId;
  final int borrowId;
  ReturnMessage({this.staffId, this.customerId, this.borrowId});

  factory ReturnMessage.fromJson(Map<String, dynamic> json) {
    return ReturnMessage(
        staffId: json['StaffId'],
        customerId: json['PatronId'],
        borrowId: json['BorrowId']);
  }

  toJson() =>
      {"StaffId": staffId, "PatronId": customerId, "BorrowId": borrowId};
}
