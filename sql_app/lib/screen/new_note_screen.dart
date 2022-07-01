import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:sql_app/service/db_service.dart';

import '../model/note.dart';

class NewNoteScreen extends StatefulWidget {
  NewNoteScreen({Key? key, this.note}) : super(key: key);
  final Note? note;
  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  late TextEditingController titleController;

  late TextEditingController bodyController;

  DbService dbService = DbService.instance;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
    bodyController = TextEditingController();

    if (widget.note != null) {
      titleController = TextEditingController(text: widget.note!.title);
      bodyController = TextEditingController(text: widget.note!.body);
    }

    dbService.configureDb();
  }

  onPressed() {
    if (widget.note != null) {
      final oldNote = widget.note;
      dbService.updateNote(
          id: oldNote!.id,
          title: titleController.text,
          body: bodyController.text);
      Navigator.pop(context);
      return;
    }

    dbService.addNote(
      body: bodyController.text,
      noteTitle: titleController.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.note != null ? "Update note" : "Add new note")),
      bottomNavigationBar: MaterialButton(
        color: Colors.green,
        onPressed: () {
          onPressed();
        },
        child: Text(widget.note != null ? "Update Note" : "Save Note"),
      ),
      body: Column(children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            hintText: "Enter your title here",
            border: InputBorder.none,
          ),
        ),
        TextField(
          controller: bodyController,
          maxLines: 15,
          onChanged: (val) {},
          decoration: InputDecoration(
            hintText: "Type something",
            border: InputBorder.none,
          ),
        ),
      ]),
    );
  }
}
