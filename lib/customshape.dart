import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = Adaptive.h(13);
    double width = Adaptive.w(100);

    var path = Path();
    path.lineTo(0, height - 30);
    path.relativeQuadraticBezierTo(width / 2, height - 10, width, height - 90);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
