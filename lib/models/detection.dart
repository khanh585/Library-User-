class Detection {
  int id;
  int staffId;
  String bookShelfName;
  String thumbnail;
  String time;
  String staffName;
  String avatar;

  Detection(
      {this.id,
      this.staffId,
      this.bookShelfName,
      this.thumbnail,
      this.time,
      this.avatar,
      this.staffName});

  Detection.customerID(
      {this.id,
      this.staffId,
      this.avatar,
      this.bookShelfName,
      this.thumbnail,
      this.time,
      this.staffName});

  factory Detection.fromJson(Map<String, dynamic> json) {
    return Detection(
        id: json['id'],
        staffId: json['staffId'],
        bookShelfName: json['bookShelfName'],
        thumbnail: json['thumbnail'],
        avatar: json['image'],
        time: json['time'],
        staffName: json['staffName']);
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id': id,
        'staffId': staffId,
        'bookShelfName': bookShelfName,
        'thumbnail': thumbnail,
        'time': time,
        'staffName': staffName
      };
}
