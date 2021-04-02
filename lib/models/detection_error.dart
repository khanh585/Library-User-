
class DetectionError {
  int id;
  int drawerDetectionId;
  String errorMessage;
  String bookName;
  bool isConfirm;
  String bookBarcode;
  int bookId;
  int typeError;

  DetectionError(
      {this.id,
      this.drawerDetectionId,
      this.errorMessage,
      this.bookName,
      this.isConfirm,
      this.bookBarcode,
      this.bookId,
      this.typeError});

  DetectionError.customerID(
      {this.id,this.drawerDetectionId, this.errorMessage,this.bookName, this.isConfirm,
       this.bookBarcode, this.bookId, this.typeError});

  factory DetectionError.fromJson(Map<String, dynamic> json) {
    return DetectionError(
      id: json['id'],
      drawerDetectionId: json['drawerDetectionId'],
      errorMessage:json['errorMessage'],
      bookName: json['bookName'],
      isConfirm: json['isConfirm'],
      bookBarcode: json['bookBarcode'],
      bookId: json['bookId'],
      typeError: json['typeError']
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'drawerDetectionId': drawerDetectionId,
        'errorMessage': errorMessage,
        'bookName': bookName,
        'isConfirm': isConfirm,
        'bookBarcode': bookBarcode,
        'bookId': bookId,
        'typeError': typeError
      };
}
