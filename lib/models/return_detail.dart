class ReturnDetail {
  int id;
  String bookName;
  String image;
  String author;
  String returnTime;
  double fee;

  ReturnDetail(
      {this.id,
      this.bookName,
      this.image,
      this.author,
      this.returnTime,
      this.fee});

  ReturnDetail.customerID(
      {this.id,this.bookName, this.image,this.author, this.returnTime, this.fee});

  factory ReturnDetail.fromJson(Map<String, dynamic> json) {
    return ReturnDetail(
      id: json['id'],
      bookName: json['bookName'],
      image: json['image'],
      author: json['author'],
      returnTime: json['returnTime'],
      fee: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'bookName': bookName,
        'image': image,
        'author' : author,
        'returnTime': returnTime,
        'fee': fee
      };
}
