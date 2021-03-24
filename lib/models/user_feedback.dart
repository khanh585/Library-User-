class UserFeedback {
  int id;
  String content;
  int rating;
  int customerId;

  UserFeedback({
    this.id,
    this.content,
    this.rating,
    this.customerId,
  });

  factory UserFeedback.fromJson(Map<String, dynamic> json) {
    return UserFeedback(
      id: json['id'],
      content: json['reviewContent'],
      rating: json['rating'],
      customerId: json['customerId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        "content": content,
        "rating": rating,
        "customerId": customerId,
      };

  static UserFeedback feedbackID(
      {int bookGroupID, String content, int rating, int customerID}) {}
}
