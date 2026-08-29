import 'package:flutter/material.dart';

class CornerFramePainter extends CustomPainter {
  final Color color;
  final double cornerLength;
  final double strokeWidth;
  final double radius;

  CornerFramePainter({
    required this.color,
    this.cornerLength = 28,
    this.strokeWidth = 4,
    this.radius = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(
      Path()
        ..moveTo(0, cornerLength)
        ..lineTo(0, radius)
        ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius))
        ..lineTo(cornerLength, 0),
      paint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerLength, 0)
        ..lineTo(size.width - radius, 0)
        ..arcToPoint(
          Offset(size.width, radius),
          radius: Radius.circular(radius),
        )
        ..lineTo(size.width, cornerLength),
      paint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(0, size.height - cornerLength)
        ..lineTo(0, size.height - radius)
        ..arcToPoint(
          Offset(radius, size.height),
          radius: Radius.circular(radius),
        )
        ..lineTo(cornerLength, size.height),
      paint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerLength, size.height)
        ..lineTo(size.width - radius, size.height)
        ..arcToPoint(
          Offset(size.width, size.height - radius),
          radius: Radius.circular(radius),
        )
        ..lineTo(size.width, size.height - cornerLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CornerFramePainter oldDelegate) => false;
}
