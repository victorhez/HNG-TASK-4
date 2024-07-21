import 'package:flutter/material.dart';

class DashedUnderlinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  DashedUnderlinePainter({
    this.dashWidth = 6.0,
    this.dashSpace = 6.0,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    double startX = 0;
    final double endX = size.width;
    final double y = size.height;

    while (startX < endX) {
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
