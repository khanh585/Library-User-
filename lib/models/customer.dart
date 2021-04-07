
class Customer {
  int id;
  String email;
  String name;
  String phone;
  String username;
  String image;
  String address;
  DateTime doB;
  DateTime createdTime;

  Customer(
      {this.id,
      this.email,
      this.name,
      this.phone,
      this.image,
      this.address,
      this.username,
      this.doB,
      this.createdTime});

  Customer.customerID(
      {this.id,this.email, this.name,this.phone, this.image, this.address, this.username, this.doB,this.createdTime});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      email: json['email'],
      name:json['name'],
      phone: json['phone'],
      image: json['image'],
      username: json['username'],
      address: json['address'],
      doB:  DateTime.parse(json['doB']),
      createdTime: DateTime.parse(json['createdTime'])
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'email': email,
        'name': name,
        'phone': phone,
        'image': image,
        'address': address,
        'doB' : doB,
        'createdTime': createdTime
      };
}
