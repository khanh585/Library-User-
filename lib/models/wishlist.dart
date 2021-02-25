import 'package:floor/floor.dart';

@entity
class WishList {
  @PrimaryKey()
  final int id;
  final String name;
  final String author;
  final String thumnail;
  bool isChecked;

  WishList(this.id, this.name, this.author, this.thumnail, this.isChecked);
}
