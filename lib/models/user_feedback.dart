import 'package:intl/intl.dart';

class UserFeedback {
  int id;
  String content;
  int rating;
  int customerId;
  String customerImage;
  String customerName;
  DateTime createdDate;
  int bookGroupId;

  UserFeedback({
    this.id,
    this.content,
    this.rating,
    this.customerId,
    this.customerImage,
    this.customerName,
    this.createdDate,
    this.bookGroupId,
  });

  factory UserFeedback.fromJson(Map<String, dynamic> json) {
    return UserFeedback(
      id: json['id'],
      content: json['reviewContent'],
      rating: json['rate'] != null ? json['rate'] : 1,
      customerId: json['patronId'],
      createdDate: DateFormat('yyyy-MM-dd').parse(json['createdDate']),
      customerImage: json['image'] != null ? json['image'] : "",
      customerName: json['patronName'],
      bookGroupId: json['bookGroupId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'bookGroupId': bookGroupId,
        "reviewContent": content,
        "rate": rating,
        "createdDate": createdDate.toString(),
        "patronName": customerName,
        "patronId": customerId,
      };

  static UserFeedback feedbackID(
      {int bookGroupID, String content, int rating, int customerID}) {}
}
