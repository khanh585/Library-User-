class Image {
  int id;
  String url;

  Image({
    this.id,
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(id: json['id'], url: json['url']);
  }

  List<String> formatImage(json) {
    List<String> list = [];
    if (json != null)
      json.forEach((element) {
        if (element['url'] != null) list.add(element['url']);
      });
    return list;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
      };
}
