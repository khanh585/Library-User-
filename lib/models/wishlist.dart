import 'package:floor/floor.dart';

@entity
class WishList {
  @PrimaryKey()
  final int id;
  final String name;
  final String author;
  final double fee;
  final String image;
  bool isChecked;

  WishList(this.id, this.name, this.author, this.fee, this.image, this.isChecked);
}
