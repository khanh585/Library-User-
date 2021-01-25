
// class Notification {
//   int userId;
//   String message;
//   DateTime time;
//   DateTime createdDate;
//   String author;
//   String image;
//   double fee;

//   Notification(
//       {this.id,
//       this.bookName,
//       this.startTime,
//       this.author,
//       this.image,
//       this.fee});

//   Notification.userId(
//       {this.id,this.bookName, this.startTime,this.author, this.image, this.fee});

//   factory Notification.fromJson(Map<String, dynamic> json) {
//     return Notification(
//       id: json['id'],
//       bookName: json['bookName'],
//       startTime: DateTime.parse(json['startTime']),
//       author: json['author'],
//       image: json['image'],
//       fee: json['total'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         // 'id': feedbackID,
//         'id' : id,
//         'bookName': bookName,
//         'startTime': startTime,
//         'author' : author,
//         'image': image,
//         'fee': fee
//       };
// }
