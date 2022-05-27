main() {
  /// for , forEach, for in
  /// while , do,  while

  for (int i = 1; i <= 10; i++) {
    /// code to be repeated
    print("My name is $i");
    // print("I am person");
  }

// for loop is slighly differnet way

  int count = 5;
  int i = 0;
  for (count; count > 0;) {
    print("I am $count");
    // print("I am from ");
    // print("I study");
    count--; //5
  }

  // print("Why the loop is not exiting");

  List<String> students = ["Hari", "Jack", "Jeff", "jessica"];

  students.forEach(
    (item) {
      /// runs for each of the item in the list
      print(item);

      if (item == "Hari") {
        /// cannot modify the list during loop
        // students.remove(item);
      }
    },
  );

  for (String item in students) {
    // print("$item in for in ");
  }

  /// while loop
  int j = 0;
  while (j < 10) {
    if (j == 1) {
      j++;
      continue;
    }

    if (j == 5) {
      break;
    }
    print("while loop runing $j");
    j++;
  }

  // break , continue

  // do {} while (j < 10);
}
