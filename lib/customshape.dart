import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = Adaptive.h(11);
    double width = Adaptive.w(100);

    var path = Path();
    path.lineTo(0, Adaptive.h(8));
    path.relativeQuadraticBezierTo(
        Adaptive.w(50), Adaptive.h(10), Adaptive.w(100), Adaptive.h(0.8));
    path.lineTo(Adaptive.w(100), 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
