
class UserNotification {
  int id;
  int userId;
  String message;
  String time;
  String createdDate;
  String bookGroupName;
  String image;

  UserNotification(
      {this.id,
      this.userId,
      this.message,
      this.time,
      this.createdDate,
      this.bookGroupName,
      this.image});

  UserNotification.userId(
      {this.id,this.userId, this.message,this.time, this.createdDate, this.bookGroupName, this.image});

  factory UserNotification.fromJson(Map<String, dynamic> json) {
    return UserNotification(
      id: json['id'],
      userId: json['userId'],
      message: json['message'],
      time: json['time'],
      createdDate: json['createdDate'],
      bookGroupName: json['bookGroupName'],
      image: json['image']
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'userId': userId,
        'message': message,
        'time' : time,
        'createdDate': createdDate,
        'bookGroupName': bookGroupName,
        'image': image
      };
}
