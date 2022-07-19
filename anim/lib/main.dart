import 'package:flutter/material.dart';

import 'screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}




/// Implicit animation 
/// Explicit animation






/// 1. Hero widget 
/// Animated versions of widgets 
/// - AnimatedContainer
/// - AnimatedOpacity
/// - AnimatedSwitcher
/// - AnimatedPositioned
/// - AnimatedIcon



/// AnimatedBuilder 
/// AnimatedWidget
/// AnimationController 
/// Tween 

/// Transition
/// SlideTransition
/// FadeTransition
/// ScaleTransition 


/// Lottie animations > Adobe After effects export .json 
/// Rive 
