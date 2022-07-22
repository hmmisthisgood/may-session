import 'package:flutter/material.dart';

class UpRoute extends PageRoute {
  Widget targetChild;

  UpRoute(this.targetChild);

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => "";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return targetChild;
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 5000);

  @override
  Duration get reverseTransitionDuration => Duration(seconds: 1);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //animation values:  0.0 - 1.0

    /// top left: (0,0)
    /// top right: (1,0)
    /// bottom left: (0,1)
    /// bottom right: (1,1)

    final tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));

    return SlideTransition(
      position: animation.drive(tween),
      child: targetChild,
    );
  }
}

/// SlideTransition
/// FadeTransition
/// ScaleTransition
///d
///
///

Route buildPage(Widget child) {
  return PageRouteBuilder(
      pageBuilder: (c, a, d) => child,
      transitionsBuilder: (c, animation, sa, a) {
        final tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}
