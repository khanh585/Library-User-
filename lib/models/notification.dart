class UserNotification {
  int id;
  int userId;
  String message;
  String returnDate;
  String createdDate;
  String bookGroupName;
  String image;
  String title;

  UserNotification(
      {this.id,
      this.userId,
      this.message,
      this.returnDate,
      this.createdDate,
      this.bookGroupName,
      this.title,
      this.image});

  UserNotification.userId(
      {this.id,
      this.userId,
      this.message,
      this.returnDate,
      this.createdDate,
      this.bookGroupName,
      this.image});

  factory UserNotification.fromJson(Map<String, dynamic> json) {
    return UserNotification(
        id: json['id'],
        userId: json['userId'],
        message: json['message'],
        returnDate: json['returnDate'],
        createdDate: json['createdDate'],
        bookGroupName: json['bookGroupName'],
        image: json['image']);
  }

  factory UserNotification.fromMessage(Map<String, dynamic> json) {
    return UserNotification(
      title: json['notification']['title'].toString(),
      image: json['data']['link'],
      bookGroupName: json['notification']['body'].toString(),
      returnDate: json['data']['returnDate'],
      createdDate: json['data']['CreatedDate'],
    );
  }
}
