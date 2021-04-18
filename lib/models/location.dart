import 'package:user_library/models/category.dart';
import 'package:user_library/models/image.dart';

class Location {
  String drawerName;
  String bookShelfName;
  String locationName;

  Location({
    this.drawerName,
    this.bookShelfName,
    this.locationName,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      drawerName: json['drawerName'] != null ? json['drawerName'] : "",
      bookShelfName: json['bookShelfName'] != null ? json['bookShelfName'] : "",
      locationName: json['locationName'] != null ? json['locationName'] : "",
    );
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      drawerName: map['drawerName'],
      bookShelfName: map['bookShelfName'],
      locationName: map['locationName'],
    );
  }
}
