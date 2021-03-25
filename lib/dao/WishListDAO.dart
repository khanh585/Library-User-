import 'package:floor/floor.dart';
import 'package:user_library/models/wishlist.dart';

@dao
abstract class WishListDAO {
  @Query('SELECT * FROM WishList WHERE id = :id')
  Future<WishList> findWishListById(int id);

  @Query('SELECT * FROM WishList')
  Future<List<WishList>> findAllWishLists();

  @Query('DROP TABLE WishList')
  Future<void> removeTable();

  @Query('DELETE FROM WishList')
  Future<void> clearTable();

  @insert
  Future<void> insertWishList(WishList wishList);

  @delete
  Future<int> deleteWishLists(WishList wishList);

  @update
  Future<int> updateWishList(WishList wishList);
}

// flutter packages pub run build_runner build
