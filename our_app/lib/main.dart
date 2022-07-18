import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_app/screen/listview_screen.dart';
import 'package:our_app/utils/custom_theme.dart';

import 'home.dart';
import 'navigation/our_route_generator.dart';
import 'navigation/routes.dart';
import 'screen/ig_screen_with_tabbar.dart';
import 'screen/login_screen.dart';
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
      onGenerateRoute: ourAwesomeRouteGenerator,
      initialRoute: Routes.splash,
      // darkTheme: ,
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
    );
  }
}
