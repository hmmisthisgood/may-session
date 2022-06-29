import 'package:flutter/gestures.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // C:\Users\Downloads\
  // D:\moviees\

  /// data/user/0/com.sql_app/data/image.jpg
  /// data/user/com.sql_app/iuabgjpabjewgbawg/

  int _dbVersion = 1;

  late Database sqlDb;
  List<Map<String, Object?>> notesList = [];

  @override
  void initState() {
    super.initState();
    configureDb();
  }

  configureDb() async {
    /// get the location/path to create a database

    final dir = await getApplicationDocumentsDirectory();

    ///  /data/user/0/com.example.sql_app/app_flutter
    final dirPath = dir.path;

    final dbPath = join(dir.path, "our_database.db");

    print(dbPath);

    final _db = await openDatabase(
      dbPath,
      version: _dbVersion,
      onConfigure: (db) {
        print("1 . on configure");

        try {
          db.execute('''
CREATE TABLE If NOT EXISTS notes(
  id INTEGER PRIMARY KEY  AUTOINCREMENT,
  title VARCHAR(50),
  body TEXT,
  createdAt VARCHAR,
  isDeleted NUMBER,
  deletedAt VARCHAR
);
''');
          db.execute('''
CREATE TABLE IF NOT EXISTS user(
id INTEGER PRIMARY KEY AUTOINCREMENT,
fullName VARCHAR(100),
bio TEXT,
age INTEGER,
phoneNumber VARCHAR
);
''');
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
    getNotes();
  }

  addNote() async {
    //     title VARCHAR(50),
    // body TEXT,
    // createdAt VARCHAR,
    // isDeleted NUMBER,
    // deletedAt VARCHAR
    final res = await sqlDb.insert("notes", {
      "title": "Charge battery",
      "body": "please charge the phones battery",
      "createdAt": DateTime.now().toString(),
      "isDeleted": false
    });
    getNotes();
    print("inserted: $res");
  }

  getNotes() async {
    final res = await sqlDb.query("notes");
    notesList = res;
    setState(() {});
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 100,
          ),
          MaterialButton(
            onPressed: () {
              addNote();
            },
            child: Text("Insert Note"),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              getNotes();
            },
            child: Text("Get notes"),
            color: Colors.green,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                final note = notesList[index];
                return Column(
                  children: [
                    Text(note['title'].toString()),
                    // Text(note['body'].toString()),

                    Text(note['createdAt'].toString()),
                  ],
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
