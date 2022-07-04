//  {
//     "userId": 1,
//     "id": 1,
//     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//   },

class Post {
  final int userId;
  final int id;
  final String title, body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.convertJsonToDart(Map json) {
    return Post(
      userId: json["userId"] ?? -1,
      id: json['if'] ?? -2,
      title: json['title'] ?? "",
      body: json['body'] ?? "",
    );
  }
}
