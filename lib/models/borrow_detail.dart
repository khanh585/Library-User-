
class BorrowDetail {
  int id;
  String bookName;
  DateTime startTime;
  String author;
  String image;
  double fee;

  BorrowDetail(
      {this.id,
      this.bookName,
      this.startTime,
      this.author,
      this.image,
      this.fee});

  BorrowDetail.feedbackID(
      {this.id,this.bookName, this.startTime,this.author, this.image, this.fee});

  factory BorrowDetail.fromJson(Map<String, dynamic> json) {
    return BorrowDetail(
      id: json['id'],
      bookName: json['bookName'],
      startTime: DateTime.parse(json['startTime']),
      author: json['author'],
      image: json['image'],
      fee: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'bookName': bookName,
        'startTime': startTime,
        'author' : author,
        'image': image,
        'fee': fee
      };
}
