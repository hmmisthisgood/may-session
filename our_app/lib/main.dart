import 'package:flutter/material.dart';
import 'package:our_app/screen/listview_screen.dart';

import 'home.dart';
import 'screen/ig_screen_with_tabbar.dart';
import 'screen/page_view_screen.dart';
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
      home: IgProfileScreen(),
      theme: ThemeData(
        // fontFamily: "Allura",
        primarySwatch: Colors.purple,
        // scaffoldBackgroundColor: Colors.black.withOpacity(0.3),
      ),
    );
  }
}
