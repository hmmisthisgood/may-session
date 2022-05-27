main() {
  ////////////////0 , 1,  2,      , 3     4,   .........
  var laptops = ["Acer", "Dell", "Acer", "Acer", "Asues", "1111", 3];

  var emptyList = [];

  final List<int> numbers = [1, 3, 5, 7];
  numbers.add(10);

  numbers.addAll([2, 4, 6, 8]);
  numbers.insert(0, 0);
  numbers.insertAll(0, [-3, -2, -1]);

  var dell = laptops[0];
  print(dell);

  laptops.remove("111");
  laptops.removeAt(3);

  print(numbers);

  print(laptops);
  final ls = laptops.toSet();
  print(ls);

  Set laptopSets = {"Acer", "Acer", "Acer", "Dell"};
  print(laptopSets);

  Map laptop = {
    "screenSize": "15.6",
    "brand": "Asus",
    15.6: "screen size",
    [1, 2, 3]: [2, 34]
  };

  final ss = laptop["screenSize"];
  print(ss);

  Map<String, dynamic> movbile = {
    "brand": "Apple",
    "model": "iphone 11",
    "screenSize": 6.3,
    "price": 1000,
  };
}
