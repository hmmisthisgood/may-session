main() {
  // implicit/indirect type inference
  var sipmpleValue = 100;
  sipmpleValue = 10;

  // explicit type.  declaration
  int age; // 4
  // print(age);

  /// int , int?
  /// double, double?

  /// definition4

/*
This
is 
mutli line 
comment
*/
  age = 10;
  age = 10000;

  /// int , double, num

  double price = 100.24;
  price = 100;
  print(price);

  num amount = 10000;
  amount = 500.500;

  String name = "Jack";

  String multiline = """ 
  This 
  is 
  multi
  lines
  """;

  print(multiline);

  bool isTudesday = true; // true, false

  dynamic changin = "i am dynamic";
  print(changin);
  changin = 100;
  // changin = changin + "10";
  print(changin);

  changin = true;
  print(changin);

  changin = 10.0;
  print(changin);

// final & const

  const pi = 3.141528;
  // const time = DateTime.now();

  const minuteInASeconds = 60;

  // pi = 3.141528;

  final gravity = 9.8;
  // gravity = 9.8;

  final currentTime = DateTime.now();
  // currentTime = DateTime.now();
  print(currentTime);
}
