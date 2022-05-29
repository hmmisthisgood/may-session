import 'dart:math';

abstract class Shape {
  num area(Map parameters);
  num perimeter(Map parameters);
}

class Triangle extends Shape {
  @override
  num area(parameters) {
    final base = parameters["base"];
    final height = parameters["height"];

    final _area = base * height / 2;
    return _area;
  }

  @override
  num perimeter(parameters) {
    final a = parameters["a"];
    final b = parameters["b"];
    final c = parameters['c'];
    final _permeter = a + b + c;
    return _permeter;
  }
}

class Circle extends Shape {
  @override
  num area(Map parameters) {
    final r = parameters["r"];
    return pi * r * r;
  }

  @override
  num perimeter(Map parameters) {
    final r = parameters["r"];
    return 2 * pi * r;
  }
}

void main(List<String> args) {
  final Shape triangle = Triangle();
  final _area = triangle.area({"base": 15, "height": 10});
  print("traingle area is : $_area");

  final Shape _circle = Circle();

  final _cArea = _circle.area({'r': 10});
  print(_cArea);
}
