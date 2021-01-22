class Feedback {
  int id;
  String content;
  int rating;
  int customerId;

  Feedback({
    this.id,
    this.content,
    this.rating,
    this.customerId,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
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
}
