class UserFeedback {
  int id;
  String content;
  int rating;
  int customerId;
  int bookGroupId;

  UserFeedback({
    this.id,
    this.content,
    this.rating,
    this.customerId,
    this.bookGroupId,
  });

  factory UserFeedback.fromJson(Map<String, dynamic> json) {
    return UserFeedback(
      id: json['id'],
      content: json['reviewContent'],
      rating: json['rate'] != null ? json['rate'] : 1,
      customerId: json['customerId'],
      bookGroupId: json['bookGroupId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'bookGroupId': bookGroupId,
        "reviewContent": content,
        "rate": rating,
        "customerId": customerId,
      };

  static UserFeedback feedbackID(
      {int bookGroupID, String content, int rating, int customerID}) {}
}
