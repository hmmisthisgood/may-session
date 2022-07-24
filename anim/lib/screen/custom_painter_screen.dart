import 'package:flutter/material.dart';

import '../clippers/traingle_painter.dart';

class CPainterScreen extends StatelessWidget {
  const CPainterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          CustomPaint(
            painter: TPainter(),
            child: Container(
              height: height,
              width: width,
            ),
          )
        ],
      ),
    );
  }
}
// CustomPaint= widget
// CustomPainter= painter class
/// Canvas
/// Paint
/// Path
