import 'dart:math';

class User {
  int _id;
  String _username;
  String? _bio;
  int _age;

  // User(int age, int id, username, bio) {
  //   _id = id;
  //   _username = username;
  //   _bio = bio;
  // }

  User({required int a, required int i, required String u, String? bio})
      : _id = i,
        _bio = bio,
        _username = u,
        _age = a;

// getter = gets a private value
// setter = sets new value to private variable

  String get username => _username;

  set setUsername(String value) {
    _username = value;
  }
}

main() {
  var singer = User(a: 18, i: 123, u: "@iamsinger");
  singer.setUsername = "@newusername";
  print(singer.username);
}
