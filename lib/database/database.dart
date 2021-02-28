import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:user_library/dao/WishListDAO.dart';
import 'package:user_library/models/wishlist.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 2, entities: [WishList])
abstract class AppDatabase extends FloorDatabase {
  WishListDAO get wishListDao;
}
// flutter packages pub run build_runner build
