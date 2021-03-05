
class TmpUser {
  String id;
  String userName;
  String address;
  String name;
  String image;
  String doB;
  String email;
  String gender;
  String role;

  TmpUser(
      {this.id,
      this.userName,
      this.name,
      this.image,
      this.address,
      this.doB,
      this.email,
      this.gender,
      this.role});

  TmpUser.customerID(
      {this.id,this.userName,this.image, this.doB,this.name, this.address, this.email, this.gender, this.role});

  factory TmpUser.fromJson(Map<String, dynamic> json) {
    return TmpUser(
      id: json['id'],
      userName: json['userName'],
      name: json['name'],
      address:json['address'],
      image: json['image'],
      doB: json['DoB'],
      email: json['email'],
      gender: json['gender'],
      role: json['role']
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'userName': userName,
        'name':name,
        'image' : image,
        'address': address,
        'doB': doB,
        'email': email,
        'gender': gender,
        'role' : role
      };
}
