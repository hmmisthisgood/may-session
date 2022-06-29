import 'package:flutter/material.dart';

import 'screen/homepage.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => Homepage());
          default:
            return MaterialPageRoute(builder: (_) => Homepage());
        }
      },
    );
  }
}
