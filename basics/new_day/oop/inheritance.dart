/// base class or super class
/// sub class  or inheriting class
/// super

/// super/base class contains common perperties
/// subclasses contain: specific/differences

class CommonUser {
  /// contains the common properties of all users

  int id;
  String fullname;
  int age;
  int friendCount;

  CommonUser({
    required this.id,
    required this.fullname,
    required this.age,
    required this.friendCount,
  });

  login() {
    print("$fullname is logging in");
  }
}

class NormalUser extends CommonUser {
  NormalUser(
      {required int i, required String f, required int a, required int fC})
      : super(
          age: a,
          id: i,
          fullname: f,
          friendCount: fC,
        );

  @override
  login() {
    print("\nI am noooooooooooooormal\n");
    return super.login();
  }
}

class AdminUser extends CommonUser {
  AdminUser(
      {required int id,
      required String fullname,
      required int age,
      required int friendCount,
      required this.role})
      : super(id: id, fullname: fullname, age: age, friendCount: friendCount);

  String role;
  //// just contains the properties of admin

  deletePost() {
    print("${fullname} is deleting a post");
  }

  approvePost() {}

  @override
  login() {
    print("\nI am admiiiiiiiiiiiiiiiiiiiiin\n");
    return super.login();
  }
}

void main() {
  var normalUser = NormalUser(i: 123, a: 23, f: "Madan Bhandari", fC: 500);
  print(normalUser.fullname);

  var adminUser = AdminUser(
      id: 123,
      fullname: "Kada admin",
      age: 21,
      friendCount: 5000,
      role: "moderator");
  adminUser.deletePost();

  normalUser.login();
  adminUser.login();
}
