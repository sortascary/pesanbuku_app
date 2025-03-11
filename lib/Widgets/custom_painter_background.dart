import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFFFFB22C);

    Path leftBottomPath = Path();
    leftBottomPath.moveTo(0, size.height * 0.7);
    leftBottomPath.quadraticBezierTo(
      size.width * 0.2, size.height * 0.85,
      size.width * 0.5, size.height,
    );
    leftBottomPath.lineTo(0, size.height);
    leftBottomPath.close();
    canvas.drawPath(leftBottomPath, paint);

    Path rightTopPath = Path();
    rightTopPath.moveTo(size.width, size.height * 0.25);
    rightTopPath.quadraticBezierTo(
      size.width * 0.8, size.height * 0.08,
      size.width * 0.5, 0,
    );
    rightTopPath.lineTo(size.width, 0);
    rightTopPath.close();
    canvas.drawPath(rightTopPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
