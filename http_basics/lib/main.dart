import 'package:flutter/material.dart';
import 'package:http_basics/screen/followers_screen.dart';

import 'screen/homepage.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FollowersScreen(
        username: "iamstrong",
      ),
    );
  }
}
