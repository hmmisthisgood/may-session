main() {
  int a = 10 + 10;
  print("1. first");
  // serverRequest();

  // final fileInfo = readFromFile();
  // print(fileInfo);
  readFromFile().then((value) {
    print(value);
  }).catchError((e) {
    print(e);
  });

  print("is this last???");
}

int serverRequest() {
  print("2. Second");

  Future.delayed(Duration(seconds: 3), () {
    print("3. This should be third");
  });
  Future.delayed(Duration(seconds: 3), () {
    print("4. This should be fourth");
  });
  print("5. This should be fifth");
  return 1;
}

Future<int> readFromFile() async {
  print("2. before await");
  await Future.delayed(Duration(seconds: 3), () {
    print("called inside delayed");
  });
  print("called below await");
  return 100000;
}

/// async , await 
/// Future, then, catchError
/// Completer 
/// FutureBuilder widget
// Stream