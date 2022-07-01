import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_app/screen/new_note_screen.dart';
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

  List<Map<String, Object?>> notesList = [];

  @override
  void initState() {
    super.initState();
    initDbAndGetNotes();
  }

  initDbAndGetNotes() async {
    DbService dbService = DbService.instance;
    await dbService.configureDb();
    getNotes();
  }

  getNotes() async {
    DbService dbService = DbService.instance;

    final val = await dbService.getNotes();

    notesList = val;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newNote');
        },
        child: Icon(Icons.edit),
      ),
      body: Container(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                final note = notesList[index];
                final creatdAt = note['createdAt'].toString();

                final formatted = Jiffy(creatdAt).format("MMMM dd HH:mm");
                final createdDate = DateTime.parse(creatdAt);
                // createdDate.difference(DateTime.now()).inDays

                return InkWell(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => NewNoteScreen(note: note)))
                        .then((value) {
                      getNotes();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                note['title'].toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () async {
                                  await DbService.instance.deleteNote(
                                      int.parse(note['id'].toString()));
                                  getNotes();
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            note['body'].toString(),
                          ),
                          SizedBox(height: 10),
                          Text(formatted),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
