import 'package:user_library/models/category.dart';
import 'package:user_library/models/image.dart';

class Book {
  int id;
  String name;
  String author;
  List<String> image;
  int pageNumber;
  String description;
  List<Category> categories;
  double rating;

  Book({
    this.id,
    this.name,
    this.author,
    this.description,
    this.pageNumber,
    this.image,
    this.categories,
    this.rating = 0,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      description: json['description'],
      pageNumber: json['pageNumber'],
      image: Image().formatImage(json['image']),
      rating: json['ratingAverage'],
      categories: Category().fromListJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
        id: map['id'],
        name: map['name'],
        author: map['author'],
        image: [map['image']]);
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['author'] = author;
    if (image.length != 0) {
      map['image'] = image[0];
    }
    return map;
  }
}
