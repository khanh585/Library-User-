import 'package:user_library/dto/CategoryDTO.dart';

class BookDTO {
  int id;
  String name;
  String author;
  dynamic image;
  int pageNumber;
  String description;
  List<CategoryDTO> categories;
  double rating;

  BookDTO({
    this.id,
    this.name,
    this.author,
    this.description,
    this.pageNumber,
    this.image,
    this.categories,
    this.rating = 0,
  });

  factory BookDTO.fromJson(Map<String, dynamic> json) {
    return BookDTO(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      description: json['description'],
      pageNumber: json['pageNumber'],
      image: json['image'],
      rating: 0,
      categories: CategoryDTO().fromListJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
