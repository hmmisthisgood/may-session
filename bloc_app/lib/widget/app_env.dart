import 'package:flutter/cupertino.dart';

class AppEnv extends InheritedWidget {
  AppEnv(
      {required this.appName,
      required this.env,
      required this.baseUrl,
      required this.child})
      : super(child: child);

  /// the app's developmenet envrionemtn. for: dev, prod , staging
  String env;

  String baseUrl;
  String appName;

  Widget child;

  static AppEnv of(BuildContext context) {
    final AppEnv result = context.dependOnInheritedWidgetOfExactType<AppEnv>()!;

    return result;
  }

  changeEnv(String value) {
    env = value;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
