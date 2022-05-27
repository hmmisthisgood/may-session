// inheritance
// polymorphism
// abstraction
// encapsulation

class User {
  int id;
  String fullname;
  int age;
  int friendCount;

  String _password;

  static const String companyName = "Abc Inc";
  String get password => _password;
  set setPassword(value) {
    _password = value;
  }

  User({
    required this.id,
    required this.fullname,
    required this.age,
    required this.friendCount,
    required String pass,
  }) : _password = pass;

  static attendance() {}

  login() {
    print('${this.fullname} has logged in');
  }

  uploadPhoto() {}
  logOut() {
    // _message();
  }

  _message() {}
}

main() {
  // user1 is an instance or object of User class
  var user1 =
      // default constructor
      new User(
    id: 1111,
    fullname: "Jack Badur",
    age: 25,
    friendCount: 1000,
    pass: "P@\$\$w0rd",
  );
  print(user1.fullname);
  user1.fullname = "Changed user1 fullname";
  print(user1.fullname);

  /// using password getter
  user1.password;
  user1.setPassword = "new password";
  // user1.setPassword("");

  /// using setter

  user1.login();

  var user2 =
      // default constructor
      new User(
          id: 1111,
          fullname: "Jack Sparrow",
          age: 40,
          friendCount: 1000,
          pass: "admin123");
  user2.login();

  /// static variable cannot be accessed from object
  // user2.companyName;

  User.companyName;
  User.attendance();
}
