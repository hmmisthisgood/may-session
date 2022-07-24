import 'package:anim/navigation/custom_route.dart';
import 'package:anim/screen/animated_container_screen.dart';
import 'package:anim/screen/custom_painter_screen.dart';
import 'package:anim/screen/transform_screen.dart';
import 'package:flutter/material.dart';

import 'custom_clipper_screen.dart';
import 'hero_screen.dart';
import 'lottie_screen.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final List pages = [
    {
      "title": "Hero animation",
      "nav_widget": HeroScreen(),
      "color": Colors.green,
    },
    {
      "title": "Animated container",
      "nav_widget": AnimContianerScreen(),
      "color": Colors.red,
    },
    {
      "title": "Transform screen",
      "nav_widget": TransformScreen(),
      "color": Colors.black,
    },
    {
      "title": "Lottie screen",
      "nav_widget": LottieScreen(),
      "color": Colors.purple,
    },
    {
      "title": "Custom clipper screen",
      "nav_widget": CCliperScreen(),
      "color": Colors.orange,
    },
    {
      "title": "Custom painter screen",
      "nav_widget": CPainterScreen(),
      "color": Colors.blue,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animatiosn"),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final page = pages[index];

          return MaterialButton(
            color: page['color'],
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => page["nav_widget"]));

              Navigator.push(context, UpRoute(page["nav_widget"]));

              // Navigator.push(context, UpRoute(LottieScreen()));

              // Navigator.push(context, buildPage(LottieScreen()));
            },
            child: Text(
              page["title"],
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
