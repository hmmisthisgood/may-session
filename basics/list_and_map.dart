main() {
  /// List
  /// Set
  /// Map

  var std = [
    "Raman",
    "Sudip",
    "Raman",
    1,
    1,
    false,
    1.0,
    [1, 2, 34]
  ];

  var dyhnamicList = ['Ram bahadur', 2, 3, false, 3.4, 10.0];

  /// exlplicit list definition
////////////////////////// 0, 1 , 2,3,4
  List<String> students = <String>["Ram", "Sita", "Ram", "Jack", "A1"];
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
    "rollNo": 122.0,
    "age": 22, // Key , Value pair
    "name": "Jeff", // MapEntry
  };
  MapEntry<String, dynamic> id = MapEntry("id", 1231231);

  var userAge = person["age"];
  print(userAge);

  person["age"] = 35;

  person["birthday"] = "Oct 1";

  print(person);
  person.addEntries([id]);
}
