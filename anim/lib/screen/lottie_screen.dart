import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatelessWidget {
  const LottieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lottie")),
      body: Center(
        child: Lottie.asset('resources/animations/car.json'),
      ),
    );
  }
}
