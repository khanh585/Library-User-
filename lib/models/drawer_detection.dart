
class DrawerDetection {
  int id;
  int detectionId;
  int drawerId;
  String drawerName;
  int count;
  int bookCount;
  String drawerBarcode;
  String bookShelfName;

  DrawerDetection(
      {this.id,
      this.detectionId,
      this.drawerId,
      this.drawerBarcode,
      this.drawerName,
      this.count,
      this.bookCount,
      this.bookShelfName});

  DrawerDetection.customerID(
      {this.id,this.detectionId, this.drawerId,this.drawerBarcode, this.bookShelfName,this.drawerName,this.count, this.bookCount});

  factory DrawerDetection.fromJson(Map<String, dynamic> json) {
    return DrawerDetection(
      id: json['id'],
      detectionId: json['detectionId'],
      drawerId:json['drawerId'],
      drawerBarcode: json['drawerBarcode'],
      bookShelfName: json['bookShelfName'],
      drawerName:json['drawerName'],
      bookCount: json['bookCount'],
      count: json['count']
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'detectionId': detectionId,
        'drawerId': drawerId,
        'drawerBarcode': drawerBarcode,
        'bookShelfName': bookShelfName,
        'drawerName': drawerName,
        'bookCount': bookCount,
        'count': count
      };
}
