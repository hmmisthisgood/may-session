import 'package:flutter/material.dart';
import 'package:our_app/utils/assets.dart';
import 'package:our_app/utils/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedInAndNavigate();
  }

  checkUserLoggedInAndNavigate() async {
    final isLoggedIn = await SharedPref.getUserLoggedIn();

    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.getBool("isLoggedIn");

    await delayNavigation(isLoggedIn);
  }

  delayNavigation(bool isLoggedIn) async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      if (isLoggedIn == false) {
        Navigator.pushNamed(context, Routes.login);
        return;
      }
      Navigator.pushNamed(context, Routes.dashboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.starbucks,
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
