import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_app/service/db_service.dart';

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
  DbService dbService = DbService();

  @override
  void initState() {
    super.initState();
    dbService.configureDb();
  }

  getNotes() async {
    final val = await dbService.getNotes();

    notesList = val;

    setState(() {});
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
            onPressed: () async {
              // DbService __db = DbService();
              // await __db.configureDb();
              // final res = await __db.addNote();
              // await __db.sqlDb.close();
              // await __db.addNote();
              final res = await dbService.addNote();
              print(res);
              if (res != 0) {
                getNotes();
              }
            },
            child: Text("Insert Note"),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () => getNotes(),
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
