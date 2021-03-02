class NewBookModel {
  String image;

  NewBookModel(this.image);
}

List<NewBookModel> newbooks =
    newBookData.map((item) => NewBookModel(item['image'])).toList();

var newBookData = [
  {"image": "images/img_newbook1.png"},
  {"image": "images/img_newbook2.png"},
  {"image": "images/img_newbook1.png"},
  {"image": "images/img_newbook2.png"},
  {"image": "images/img_newbook1.png"},
  {"image": "images/img_newbook2.png"},
  {"image": "images/img_newbook1.png"},
  {"image": "images/img_newbook2.png"},
];