import 'package:user_library/models/customer.dart';
import 'package:intl/intl.dart';

class TmpUser {
  String id;
  String username;
  String address;
  String name;
  String image;
  String doB;
  String email;
  String createdTime;
  String password;
  String gender;
  String phone;
  String deviceToken;
  int roleId;

  TmpUser(
      {this.id,
      this.username,
      this.name,
      this.image,
      this.address,
      this.doB,
      this.email,
      this.deviceToken,
      this.createdTime,
      this.password,
      this.phone,
      this.gender,
      this.roleId});

  TmpUser.customerID(
      {this.id,
      this.username,
      this.phone,
      this.image,
      this.doB,
      this.createdTime,
      this.password,
      this.name,
      this.deviceToken,
      this.address,
      this.email,
      this.gender,
      this.roleId});

  factory TmpUser.fromJson(Map<String, dynamic> json) {
    return TmpUser(
        id: json['id'].toString(),
        username: json['username'],
        name: json['name'],
        address: json['address'],
        image: json['image'],
        phone: json['phone'],
        doB: json['doB'],
        email: json['email'],
        deviceToken: json['deviceToken'],
        createdTime: json['createdTime'],
        password: json['password'],
        gender: json['gender'],
        roleId: int.parse(json['roleId'].toString()));
  }

  Customer toCustomer() {
    DateTime doB = DateFormat('MM/dd/yyyy').parse(this.doB.split(' ')[0]);
    DateTime createdTime =
        DateFormat('MM/dd/yyyy').parse(this.createdTime.split(' ')[0]);
    Customer cus = new Customer(
        address: this.address,
        createdTime: createdTime,
        doB: doB,
        email: this.email,
        id: int.parse(this.id),
        image: this.image,
        name: this.name,
        phone: this.phone);
    return cus;
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id': id,
        'username': username,
        'name': name,
        'image': image,
        'address': address,
        'doB': doB,
        'email': email,
        'deviceToken': deviceToken,
        'password': password,
        'createdTime': createdTime,
        'gender': gender,
        'roleId': roleId
      };

  Map<String, dynamic> toJsonForCreate() => {
        'username': username,
        'name': name,
        'image': image,
        'address': address,
        'doB': doB,
        'email': email,
        'password': password,
        'phone': phone,
        'gender': gender,
        'createdTime': createdTime,
        'roleId': roleId,
        'deviceToken': deviceToken,
      };
}
