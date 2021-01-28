import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:user_library/context.dart';
import 'package:user_library/models/book.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  String booksTable = 'book_table';
  String colId = 'id';
  String colName = 'name';
  String colAuthor = 'author';
  String colImage = 'image';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    if (!contextData['hasTable'] || contextData['hasTable'] == null) {
      await tableIsEmpty();
    }

    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + '/wishlist.db';
    final wishListDb = await openDatabase(path);
    return wishListDb;
  }

  Future<void> tableIsEmpty() async {
    try {
      Sqflite.firstIntValue(
          await _db.rawQuery('SELECT COUNT(*) FROM $booksTable'));
      contextData['hasTable'] = true;
    } catch (e) {
      if (e.toString().contains('no such table')) {
        _createDb(_db, 1);
      }
    }
  }

  void _createDb(Database db, int version) async {
    String sql = 'CREATE TABLE $booksTable ' +
        '($colId INTEGER PRIMARY KEY AUTOINCREMENT, ' +
        ' $colName TEXT, ' +
        ' $colAuthor TEXT,' +
        ' $colImage TEXT)';
    await db.execute(sql);
  }

  Future<List<Map<String, dynamic>>> getBookMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(booksTable);
    return result;
  }

  Future<List<Book>> getBookList() async {
    final List<Map<String, dynamic>> bookMapList = await getBookMapList();
    final List<Book> bookList = [];
    bookMapList.forEach((element) {
      bookList.add(Book.fromMap(element));
    });
    return bookList;
  }

  Future<int> insertBook(Book book) async {
    int result = 0;
    try {
      Database db = await this.db;
      result = await db.insert(booksTable, book.toMap());
      return result;
    } catch (e) {} finally {
      return result;
    }
  }

  Future<int> deleteBook(int bookId) async {
    Database db = await this.db;
    final result =
        await db.delete(booksTable, where: '$colId = ?', whereArgs: [bookId]);
    return result;
  }

  Future<bool> deleteAllBook() async {
    Database db = await this.db;
    await db.execute("delete from " + booksTable);
    return true;
  }
}
