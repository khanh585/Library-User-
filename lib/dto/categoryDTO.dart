class CategoryDTO {
  int id;
  String name;

  // CategoryDTO(int id, String name) {
  //   this.id = id;
  //   this.name = name;
  // }
  CategoryDTO({
    this.id,
    this.name,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) {
    return CategoryDTO(id: json['id'], name: json['name']);
  }

  List<CategoryDTO> fromListJson(List json) {
    List<CategoryDTO> list = [];
    json.forEach((element) {
      list.add(CategoryDTO.fromJson(element));
    });
    return list;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
