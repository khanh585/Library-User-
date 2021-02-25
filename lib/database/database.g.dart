// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WishListDAO _wishListDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WishList` (`id` INTEGER, `name` TEXT, `author` TEXT, `thumnail` TEXT, `isChecked` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WishListDAO get wishListDao {
    return _wishListDaoInstance ??= _$WishListDAO(database, changeListener);
  }
}

class _$WishListDAO extends WishListDAO {
  _$WishListDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _wishListInsertionAdapter = InsertionAdapter(
            database,
            'WishList',
            (WishList item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'author': item.author,
                  'thumnail': item.thumnail,
                  'isChecked':
                      item.isChecked == null ? null : (item.isChecked ? 1 : 0)
                }),
        _wishListUpdateAdapter = UpdateAdapter(
            database,
            'WishList',
            ['id'],
            (WishList item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'author': item.author,
                  'thumnail': item.thumnail,
                  'isChecked':
                      item.isChecked == null ? null : (item.isChecked ? 1 : 0)
                }),
        _wishListDeletionAdapter = DeletionAdapter(
            database,
            'WishList',
            ['id'],
            (WishList item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'author': item.author,
                  'thumnail': item.thumnail,
                  'isChecked':
                      item.isChecked == null ? null : (item.isChecked ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WishList> _wishListInsertionAdapter;

  final UpdateAdapter<WishList> _wishListUpdateAdapter;

  final DeletionAdapter<WishList> _wishListDeletionAdapter;

  @override
  Future<WishList> findWishListById(int id) async {
    return _queryAdapter.query('SELECT * FROM WishList WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => WishList(
            row['id'] as int,
            row['name'] as String,
            row['author'] as String,
            row['thumnail'] as String,
            row['isChecked'] == null ? null : (row['isChecked'] as int) != 0));
  }

  @override
  Future<List<WishList>> findAllWishLists() async {
    return _queryAdapter.queryList('SELECT * FROM WishList',
        mapper: (Map<String, dynamic> row) => WishList(
            row['id'] as int,
            row['name'] as String,
            row['author'] as String,
            row['thumnail'] as String,
            row['isChecked'] == null ? null : (row['isChecked'] as int) != 0));
  }

  @override
  Future<void> clearTable() async {
    await _queryAdapter.queryNoReturn('DROP TABLE WishList');
  }

  @override
  Future<void> insertWishList(WishList wishList) async {
    await _wishListInsertionAdapter.insert(wishList, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateWishList(WishList wishList) {
    return _wishListUpdateAdapter.updateAndReturnChangedRows(
        wishList, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteWishLists(WishList wishList) {
    return _wishListDeletionAdapter.deleteAndReturnChangedRows(wishList);
  }
}
