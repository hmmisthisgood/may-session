main() {
  /// for
  /// - for each
  /// - for in
  int count = 10;

  List<String> students = ["Raman", "Deepa", "Sudip", "Sankalp", "Manish"];

  for (count; count >= 0;) {
    count--;

    print(count); //9
    count--;

    if (count == 4) {
      break;
    }

    print("print this also");
  }

  print("The loop could be over now");

  /// for each loop

  students.forEach(
    (item) {
      print("students from for each:" + item);
    },
  );

  for (String item in students) {
    print("students from for in:" + item);
  }

  // count = 10;

  /// while

  int whileCount = 0;
  while (whileCount < 5) {
    print("While is less than 5");
    whileCount++;
  }

  // print("somethin");

  /// do while
  ///
  int doCount = 0;
  // do {} while (doCount < 5);
}
