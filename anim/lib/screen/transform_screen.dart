import 'dart:math';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TransformScreen extends StatefulWidget {
  const TransformScreen({Key? key}) : super(key: key);

  @override
  State<TransformScreen> createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController scaleAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      reverseDuration: Duration(seconds: 2),
    );
    scaleAnim = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
      reverseDuration: Duration(seconds: 2),
    );
    Tween<double> angleTween = Tween(begin: 0.0, end: pi);

    animationController.addListener(() {
      if (animationController.isCompleted) {
        // animationController.reverse();
        animationController.repeat();
      }
    });

    scaleAnim.addListener(() {
      scaleAnim.repeat();
    });

    scaleAnim.forward();
    animationController.forward();
  }

// 1970
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(title: const Text("Transform")),
        body: ListView(
          children: [
            SizedBox(height: 100),
            // Container(
            //   color: Colors.green,
            //   child: Transform.rotate(
            //     angle: -pi / 2,
            //     child: Text(
            //       "Our services",
            //       style: const TextStyle(fontSize: 24),
            //     ),
            //   ),
            // ),

            SizedBox(height: 50),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                // print(animationController.value);
                return Transform.rotate(
                  angle: 2 * pi * animationController.value,
                  child: Text(
                    "Our services",
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: scaleAnim,
              builder: (context, child) {
                /// 0.0 - 1.0
                return Transform.scale(
                    scale: 4 * scaleAnim.value, child: Icon(Icons.home));
              },
            ),

            // Text(" overlaps"),
            SizedBox(height: 150),

            // Container(
            //   color: Colors.yellow,
            //   child: RotatedBox(
            //     quarterTurns: -1,
            //     child: Text(
            //       "Rotated Box",
            //       style: const TextStyle(fontSize: 24),
            //     ),
            //   ),
            // ),
            // Text("dont overlap"),

            AnimatedBuilder(
              animation: scaleAnim,
              builder: (context, child) {
                /// 0.0 - 1.0
                return Transform.translate(
                    offset:
                        Offset(scaleAnim.value * width, scaleAnim.value * 350),
                    child: Text(" I'm here "));
              },
            ),

            // Transform.scale(
            //   scale: -0.1,
            //   child: Icon(Icons.cabin),
            // ),
            // Transform.translate(
            //   offset: Offset(100, 50),
            //   child: Text(" I'm here "),
            // )
            AnimatedBuilder(
                animation: scaleAnim,
                child: const Icon(Icons.home),
                builder: (context, _) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..scale(scaleAnim.value * 5)
                      ..rotateX(2 * scaleAnim.value * pi / 4),
                    child: _,
                  );
                }),
          ],
        ));
  }
}

/// Transform widgets:
/// 1. Transform = more powerful
/// 2. Transform.rotate() ; alternative, RotatedBox widget
/// 3. Transform.scale()
/// 4. Transform.translate()

// AnimatedBuilder
// AnimatedWidget
