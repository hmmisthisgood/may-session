import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    // brush.color = Colors.red;
    brush.strokeCap = StrokeCap.round;
    brush.strokeWidth = 1.0;
    brush.shader = ui.Gradient.linear(Offset.zero,
        Offset(size.width, size.height), [Colors.blue, Colors.pink]);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 150, brush);

    Path path = Path();
    path.moveTo(0, 0);

    path.lineTo(200, 0);
    path.lineTo(200, 150);
    path.arcToPoint(Offset.zero, radius: Radius.circular(30));
    path.close();

    canvas.drawPath(path, brush);

    // canvas.drawPaint(brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
