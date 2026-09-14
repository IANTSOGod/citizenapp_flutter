import 'package:flutter/material.dart';

class ConnectionPainter extends CustomPainter {
  final Color color;

  ConnectionPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height * 0.43);

    final left = Offset(size.width * 0.18, size.height * 0.57);

    final right = Offset(size.width * 0.82, size.height * 0.27);

    final pathLeft = Path()
      ..moveTo(center.dx - 70, center.dy + 15)
      ..quadraticBezierTo(
        size.width * 0.30,
        size.height * 0.50,
        left.dx,
        left.dy,
      );

    final pathRight = Path()
      ..moveTo(center.dx + 70, center.dy - 15)
      ..quadraticBezierTo(
        size.width * 0.70,
        size.height * 0.33,
        right.dx,
        right.dy,
      );

    canvas.drawPath(pathLeft, paint);
    canvas.drawPath(pathRight, paint);

    // Petits points aux extrémités
    final dotPaint = Paint()..color = color;

    canvas.drawCircle(left, 3, dotPaint);
    canvas.drawCircle(right, 3, dotPaint);
  }

  @override
  bool shouldRepaint(covariant ConnectionPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
