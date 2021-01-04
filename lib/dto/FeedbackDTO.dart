import 'package:user_library/dto/CategoryDTO.dart';

class FeedbackDTO {
  int feedbackID;
  int customerID;
  int bookGroupID;
  int rating;
  String content;

  FeedbackDTO(
      {this.feedbackID,
      this.bookGroupID,
      this.content,
      this.customerID,
      this.rating});

  FeedbackDTO.feedbackID(
      {this.bookGroupID, this.content, this.customerID, this.rating});

  factory FeedbackDTO.fromJson(Map<String, dynamic> json) {
    return FeedbackDTO(
      feedbackID: json['id'],
      customerID: json['customerId'],
      bookGroupID: json['bookGroupId'],
      rating: json['rating'],
      content: json['reviewContent'],
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'customerId': customerID,
        'bookGroupId': bookGroupID,
        'rating': rating,
        'reviewContent': "${content}",
      };
}
