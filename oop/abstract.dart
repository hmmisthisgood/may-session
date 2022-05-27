abstract class Shape {
  num area(num length, num breadth);

  num perimeter(num length, num breadth);
}

class Rectangle extends Shape {
  @override
  num area(num length, num breadth) {
    final _area = length * breadth;
    return _area;
  }

  @override
  num perimeter(num length, num breadth) {
    final _perim = 2 * (length + breadth);
    return _perim;
  }
}

class Sqaure extends Shape {
  @override
  num area(num length, num breadth) {
    if (length != breadth) {
      throw "length and breadth must be same for square";
    }

    return length * length;
  }

  @override
  num perimeter(num length, num breadth) {
    return 4 * length;
  }
}

main() {
  final rect = Rectangle();
  var rectAreea = rect.area(100, 500);
  print("the area of rectabngle is $rectAreea");

  var sq = Sqaure();

  var sqArea = sq.area(40, 50);
  print("the area of square is $sqArea");
}
