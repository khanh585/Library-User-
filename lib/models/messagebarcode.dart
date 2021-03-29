class MessageBarcode {
  int staffId;
  final int customerId;
  final String barcode;
  MessageBarcode({this.staffId, this.customerId, this.barcode});

  factory MessageBarcode.fromJson(Map<String, dynamic> json) {
    return MessageBarcode(
      staffId: json['StaffId'],
      customerId: json['CustomerId'],
      barcode: json['Barcode'],
    );
  }

  toJson() =>
      {"StaffId": staffId, "CustomerId": customerId, "Barcode": barcode};
}
