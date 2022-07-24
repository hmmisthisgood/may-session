import 'package:flutter/cupertino.dart';

class TClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    final width = size.width;

    ///      <----- width------>
    /// 0,0 |----------------|(width,0)
    ///     | -             -|
    ///     |   -         -  |
    ///           -     -
    ///             -
    ///             (width/2, 200)

    path.moveTo(0, 0);

    path.lineTo(size.width, 0);
    path.lineTo(width, 150);
    path.arcToPoint(Offset.zero, radius: Radius.circular(30));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
