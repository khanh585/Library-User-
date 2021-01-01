import 'package:user_library/dto/categoryDTO.dart';

class BookDTO {
  String id;
  String name;
  String author;
  String image;
  int pageNumber;
  String description;
  CategoryDTO category;
  int status;
  double rating;

  BookDTO() {
    this.status = 0;
    this.rating = 0;
  }

  BookDTO.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.author = json['author'],
        this.image = json['image'],
        pageNumber = json['pageNumber'],
        description = json['description'],
        category = CategoryDTO.fromJson(json['category']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
