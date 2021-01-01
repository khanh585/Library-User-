class CategoryDTO {
  int id;
  String name;

  CategoryDTO(int id, String name) {
    this.id = id;
    this.name = name;
  }

  CategoryDTO.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
