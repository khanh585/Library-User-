import 'package:intl/intl.dart';
class BorrowDetail {
  int id;
  String bookName;
  DateTime startTime;
  DateTime returnTime;
  String author;
  String image;
  double fee;

  BorrowDetail(
      {this.id,
      this.bookName,
      this.startTime,
      this.returnTime,
      this.author,
      this.image,
      this.fee});

  BorrowDetail.feedbackID(
      {this.id,this.bookName, this.startTime, this.returnTime, this.author, this.image, this.fee});

  factory BorrowDetail.fromJson(Map<String, dynamic> json) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    return BorrowDetail(
      id: json['id'],
      bookName: json['bookName'],
      startTime: dateFormat.parse(json['startTime']),
      returnTime:dateFormat.parse(json['returnTime']),
      author: json['author'],
      image: json['image'],
      fee: json['fee'],
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'bookName': bookName,
        'startTime': startTime,
        'returnTime': returnTime,
        'author' : author,
        'image': image,
        'fee': fee
      };
}
