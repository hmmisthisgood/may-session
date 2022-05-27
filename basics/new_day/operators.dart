/// operand: a, b, 1, 2
///  operator: + , - * , /, %, ....
///

main() {
  /// arithmetic operators
  /// + , - * , /, %,
  int a = 10;
  int b = 5;
  int sum = a + b;
  int product = a * b;
  var division = a / b;

  int remider = a % b;

  /// logical operators
  /// and = &&
  /// or = || (pipe symbol)
  /// not = !

  /// OR: If any one of the value is true, result is true
  bool orRes = false || false && true;

  /// In AND: if any one of the value is false, the result is false
  bool andRes = false && true;

//// NOT: reverses the value
  bool notResult = !false;

  /// bitwise opertors

  /// comparison uperators
  // == , <, >, <=, >=

  final status = 1 <= 5 || 2 > 5;

  final checkEqual = "5" == 5;

  /// unary and ternary
  int value = 10;
  value++;
  value--;
  ++value;
  --value;

  value += 1; // value= value+1;

  /// ternary operator: (condition)? -----true case--- : ---false case------
  (10 == 11) ? print("10 is equal to 10") : print("10 is not equal");
}
