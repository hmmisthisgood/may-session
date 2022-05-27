class User {
  int id;
  String username;
  int age;
  static String orgName = "Company xyz";

  User({
    required this.id,
    required this.username,
    required this.age,
  });

  login() {
    print("Login has started.......");
  }

  logout() {}
}

// super class or base class
// child class or sub class

class Admin extends User {
  Admin({
    required String u,
    required int id,
    required int age,
    required this.role,
  }) : super(age: age, id: id, username: u);

  String role;

  @override
  login() {
    ///

    print("This is admin login ");

    return super.login();
  }
}

class Client extends User {
  Client({
    required int id,
    required String username,
    required int age,
    required this.bio,
    this.pronoun,
  }) : super(id: id, username: username, age: age);

  String bio;
  String? pronoun;

  @override
  login() {}
}

main() {
  Admin adminUser =
      Admin(u: "@iamadmin", id: 123, age: 40, role: "normal admin");
  print(adminUser.username);

  Client clientUser = Client(
      id: 324234,
      username: "@iam_cool",
      age: 20,
      bio: 'i Am C00l',
      pronoun: "he");

  Client newUser = Client(
      id: 214124,
      username: "@i_am_new",
      age: 20,
      bio: 'i Am C00l',
      pronoun: "he");
  print("I am ${clientUser.bio}");
  adminUser.login();
  clientUser.login();
  // clientUser.orgName;
  // adminUser.orgName;

  User justUser = User(id: 123, username: "username", age: 233);
  print(User.orgName);

  // justUser.orgName;
  User.orgName = "Google Inc";
  print(User.orgName);
}
