import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  late Database sqlDb;

  ///
  // DbService();
  DbService._internal() {
    ///
  }

  static DbService _service = DbService._internal();

  static DbService get instance => _service;

  static const int _dbVersion = 1;

  static const _notesTable = "notes";
  static const _usersTable = "user";

  static const _createNotesTable = '''
    CREATE TABLE If NOT EXISTS "$_notesTable"(
      id INTEGER PRIMARY KEY  AUTOINCREMENT,
      title VARCHAR(50),
      body TEXT,
      createdAt VARCHAR,
      isDeleted NUMBER,
      deletedAt VARCHAR
    );
''';

  static const _createUsersTable = '''
CREATE TABLE IF NOT EXISTS "$_usersTable"(
id INTEGER PRIMARY KEY AUTOINCREMENT,
fullName VARCHAR(100),
bio TEXT,
age INTEGER,
phoneNumber VARCHAR
);
''';

  configureDb() async {
    /// get the location/path to create a database

    final dir = await getApplicationDocumentsDirectory();

    ///  /data/user/0/com.example.sql_app/app_flutter
    final dirPath = dir.path;

    final dbPath = join(dir.path, "our_database.db");

    print(dbPath);

    final _db = await openDatabase(
      dbPath,
      version: _dbVersion, //1
      onConfigure: (db) {
        print("1 . on configure");

        try {
          db.execute(_createNotesTable);
          db.execute(_createUsersTable);
        } catch (e) {
          print(e);
        }
      },
      onCreate: (db, version) {
        print(" on create");
      },
      onUpgrade: (db, oldV, newV) {
        print(" on upgrade");
      },
      onDowngrade: (db, oldV, newV) {
        print(" on downgrade");
      },
      onOpen: (db) {
        print(" on open");
      },
    );

    sqlDb = _db;
  }

  Future<int> addNote({String? noteTitle, required String body}) async {
    return await sqlDb.insert(_notesTable, {
      "title": noteTitle,
      "body": body,
      "createdAt": DateTime.now().toString(),
      "isDeleted": false
    });
  }

  Future<List<Map<String, Object?>>> getNotes() async {
    final res = await sqlDb.query(_notesTable);
    return res;
  }

  updateNote({required int id, required String title, required String body}) {
    sqlDb.update(
      _notesTable,
      {"title": title, "body": body},
      where: "id=?",
      whereArgs: [id],
    );

    final updateQuery =
        '''UPDATE notes SET title = "$title", body = "$body" WHERE id=$id''';

    // sqlDb.rawUpdate(updateQuery);
  }

  deleteNote(int id) {
    return sqlDb.delete(_notesTable, where: "id=?", whereArgs: [id]);
    // final deleteQuery = '''  DELETE FROM notes   WHERE id=$id''';

    // sqlDb.rawDelete(deleteQuery)
  }
}
