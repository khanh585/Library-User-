import 'package:user_library/models/image.dart';

class DetectionError {
  int id;
  int drawerDetectionId;
  String errorMessage;
  String bookName;
  bool isConfirm;
  bool isRejected;
  bool isDeleted;
  String bookBarcode;
  int bookId;
  int bookGroupId;
  int typeError;
  List<String> image;

  DetectionError(
      {this.id,
      this.drawerDetectionId,
      this.errorMessage,
      this.bookName,
      this.isConfirm,
      this.isRejected,
      this.isDeleted,
      this.bookBarcode,
      this.bookGroupId,
      this.bookId,
      this.image,
      this.typeError});

  DetectionError.customerID(
      {this.id,
      this.drawerDetectionId,
      this.errorMessage,
      this.bookName,
      this.isConfirm,
      this.isRejected,
      this.bookBarcode,
      this.bookId,
      this.typeError,
      this.bookGroupId});

  factory DetectionError.fromJson(Map<String, dynamic> json) {
    return DetectionError(
        id: json['id'],
        drawerDetectionId: json['drawerDetectionId'],
        errorMessage: json['errorMessage'],
        bookName: json['bookName'],
        isConfirm: json['isConfirm'],
        isRejected: json['isRejected'],
        isDeleted: true,
        bookBarcode: json['bookBarcode'],
        bookId: json['bookId'],
        typeError: json['typeError'],
        image: Image().formatImage(json['image']),
        bookGroupId: json['bookGroupId']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'drawerDetectionId': drawerDetectionId,
        'errorMessage': errorMessage,
        'bookName': bookName,
        'isConfirm': isConfirm,
        'isRejected': isRejected,
        'isDeleted': isDeleted,
        'bookBarcode': bookBarcode,
        'bookId': bookId,
        'typeError': typeError
      };
}
