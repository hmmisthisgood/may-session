main() {
  /// List
  /// Set
  /// Map

  var dyhnamicList = [2, 'Ram bahadur', 3, false, 3.4, 10.0];

  /// exlplicit list definition
////////////////////////// 0, 1 , 2,3
  List<String> students = ["Ram", "Sita", "Ram", "Jack", "A1"];
  print(students);

  var first = students[0];
  var last = students[4];

  students.add("Jack");

  // students.addAll(['jeff', "michael"]);

  students.removeAt(0);
  // students.remove("Ram");

  print(students);
  students.toSet();

  /// Set
  ///
  Set setStudents = {"Ram", "Sita", "Ram", "jack"};

  print(setStudents);

  /// Map

  Map<String, dynamic> person = {
    "age": 22, // Key , Value pair
    "name": "Jeff", // MapEntry
    "rollNo": 122.0,
  };

  var userAge = person["age"];
  print(userAge);

  person["age"] = 35;

  person["birthday"] = "Oct 1";
  print(person);
}
