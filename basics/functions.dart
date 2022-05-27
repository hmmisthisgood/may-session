main() {
  var ourArea = area(length: 100.03, breadth: 50);
  print(ourArea);

  Function(num, num) perimeter = (num length, num breadth) {
    final perim = 2 * (length + breadth);
    return perim;
  };
  final p = perimeter(100, 200);
  print("perimeter is $p");

  List<String> students = ["Jeff", "Jack", "John", "jessica"];
  students.forEach(
    (element) {},
  );
}

num area({required num length, required num breadth}) {
  final currentArea = length * breadth;
  // print("area is $area");
  return currentArea;

  print("this ");
}
