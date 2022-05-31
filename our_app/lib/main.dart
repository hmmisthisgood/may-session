import 'package:flutter/material.dart';

import 'home.dart';
import 'screen/row_and_columns_screen.dart';
// import 'package:our_app/home.dart';

void main() {
  runApp(OurApp());
}

/// Stateful widget
/// Stateless Widget

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Our app",
      home: RowAndColumnScreen(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
