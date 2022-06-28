import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_app/screen/listview_screen.dart';
import 'package:our_app/screen/splash_screen.dart';

import '../screen/ig_screen_with_tabbar.dart';
import '../screen/login_screen.dart';
import '../screen/page_view_screen.dart';
import 'routes.dart';

Route ourAwesomeRouteGenerator(settings) {
  switch (settings.name) {
    case Routes.login:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case Routes.listview:
      return MaterialPageRoute(builder: (_) => ListViewScreen());

    case Routes.dashboard:
      return MaterialPageRoute(builder: (_) => IgProfileScreen());
    case Routes.splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    default:
      return MaterialPageRoute(builder: (_) => LoginScreen());
  }
}
