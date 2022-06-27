import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_app/screen/listview_screen.dart';

import '../screen/login_screen.dart';
import 'routes.dart';

Route ourAwesomeRouteGenerator(settings) {
  switch (settings.name) {
    case Routes.login:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case Routes.listview:
      return MaterialPageRoute(builder: (_) => ListViewScreen());

    default:
      return MaterialPageRoute(builder: (_) => LoginScreen());
  }
}
