
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
      {this.id, this.username, this.phone, this.image, this.doB, this.createdTime, 
      this.password, this.name,this.deviceToken, this.address, this.email, this.gender, this.roleId});

  factory TmpUser.fromJson(Map<String, dynamic> json) {
    return TmpUser(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      address:json['address'],
      image: json['image'],
      doB: json['DoB'],
      email: json['email'],
      deviceToken: json['deviceToken'],
      createdTime: json['createdTime'],
      password: json['password'],
      gender: json['gender'],
      roleId: int.parse(json['role'])
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'username': username,
        'name':name,
        'image' : image,
        'address': address,
        'doB': doB,
        'email': email,
        'deviceToken': deviceToken,
        'password': password,
        'createdTime': createdTime,
        'gender': gender,
        'role' : roleId
      };
}
