class Note {
  //  id INTEGER PRIMARY KEY  AUTOINCREMENT,
  // title VARCHAR(50),
  // body TEXT,
  // createdAt VARCHAR,
  // isDeleted NUMBER,
  // deletedAt VARCHAR

  final int id;
  final String title, body;
  final bool isDeleted;
  final String createdAt;
  final String? deletedAt;

  Note(
      {required this.id,
      required this.title,
      required this.body,
      required this.isDeleted,
      required this.createdAt,
      this.deletedAt});

  static Note fromJson(Map json) {
    return Note(
      id: json['id'],
      title: json['title'] ?? "",
      body: json['body'] ?? "",
      isDeleted: json['isDeleted'] == 0 ? false : true,

      /// 1 or 0
      createdAt: json['createdAt'],
    );
  }

  static List<Note> fromList(List<Map<String, Object?>> data) {
    return data.map((e) => Note.fromJson(e)).toList();
  }
}
