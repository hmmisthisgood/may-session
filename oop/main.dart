import 'private_variable.dart';

class User {
// inheritance
// abstraction
// polymorphishm
// encapsulation =

  int id;
  String username;
  int age;
  String? bio;

  User(
      // this.username,
      {
    required this.id,
    required this.username,
    required this.age,
    this.bio,
  }); // named arguments in constructor

  login() {
    print("$username is logging in");
  }

  postStory() {
    print("I $username is posting story......");
  }
}

main() {
  //
  var user1 = new User(
    // "@cool",
    id: 11111,
    username: "@cool",
    age: 12,
  );

  print(user1.username);

  user1.username = "@notsocool";
  print(user1.username);

  var ronaldo = User(id: 12321, username: "@ronaldo", age: 38);

  ronaldo.login();

  ronaldo.postStory();
  // var anotherUser = _UUser();
  // constructor
  // var user2 = User();
}
