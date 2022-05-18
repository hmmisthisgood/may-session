main() {
  // +, - , * , /, %
  int a = 10;
  int b = 10;
  int c = a + b;

  var d = c * b;

  // ! , && , ||
  var thisIsFale = !false;
  print(thisIsFale);

  var something = false || true;
  print("this is something: $something");

  // <, >, <= , >=
  bool statement = 1 > 5;

  //  ternary operator
  /// (condition) ? ----- true condition ----- : ---false ------
  (1 < 10) ? print("1 is less than 10 ") : print("1 is greater than 10");

  // unary operator
  a++;
  a--;

  /// null realted operator

  int? what; //10

  // var sum = what + 10;
}
