import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  late Offset center;
  late double radius, containerHeight;
  late BuildContext context;

  late Color color;
  late double statusBarHeight, screenWidth;

  MyPainter(
      {required this.context,
      required this.containerHeight,
      required this.center,
      required this.radius}) {
    color = Colors.indigo;
    statusBarHeight = MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePainter = Paint();

    circlePainter.color = color;
    canvas.clipRect(
        Rect.fromLTWH(0, 0, screenWidth, containerHeight + statusBarHeight));
    canvas.drawCircle(center, radius, circlePainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
