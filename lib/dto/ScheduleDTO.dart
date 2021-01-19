import 'package:user_library/dto/CategoryDTO.dart';

class ScheduleDTO {
  int id;
  String customerName;
  DateTime startTime;
  DateTime endTime;
  int quantity;
  double total;

  ScheduleDTO(
      {this.id,
      this.customerName,
      this.startTime,
      this.endTime,
      this.quantity,
      this.total});

  ScheduleDTO.feedbackID(
      {this.id,this.customerName, this.startTime, this.endTime, this.quantity,this.total});

  factory ScheduleDTO.fromJson(Map<String, dynamic> json) {
    return ScheduleDTO(
      id: json['id'],
      customerName: json['customerName'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      quantity: json['quantity'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'customerName': customerName,
        'startTime': startTime,
        'returnTime': endTime,
        'quantity': quantity,
        'total' : total
      };
}
