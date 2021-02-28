

class Schedule {
  int id;
  String customerName;
  DateTime startTime;
  DateTime endTime;
  String image;
  int quantity;
  double total;

  Schedule(
      {this.id,
      this.customerName,
      this.startTime,
      this.endTime,
      this.quantity,
      this.image,
      this.total});

  Schedule.feedbackID(
      {this.id,this.customerName, this.startTime, this.endTime, this.quantity, this.image,this.total});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      customerName: json['customerName'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      quantity: json['quantity'],
      image: json['image'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id': id,
        'customerName': customerName,
        'startTime': startTime,
        'returnTime': endTime,
        'quantity': quantity,
        'image': image,
        'total' : total
      };
}
