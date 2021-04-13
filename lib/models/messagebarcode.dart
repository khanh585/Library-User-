class MessageBarcode {
  int staffId;
  final String barcode;
  final String type;
  MessageBarcode({this.type, this.staffId, this.barcode});

  factory MessageBarcode.fromJson(Map<String, dynamic> json) {
    return MessageBarcode(
      staffId: json['StaffId'],
      type: json['Type'],
      barcode: json['Barcode'],
    );
  }

  toJson() => {"StaffId": staffId, "Type": type, "Barcode": barcode};
}
