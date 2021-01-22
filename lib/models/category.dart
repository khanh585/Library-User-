class Category {
  int id;
  String name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  List<Category> fromListJson(List json) {
    List<Category> list = [];
    if (json != null)
      json.forEach((element) {
        list.add(Category.fromJson(element));
      });
    return list;
  }

  String toString() {
    return "${name} $id";
  }
}
