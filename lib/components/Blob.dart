import 'package:flutter/material.dart';

class Blob extends StatelessWidget {
  final double size;
  final Color color;
  final double rotation;

  const Blob({
    required this.size,
    required this.color,
    required this.rotation,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BlobPainter(
          color: color,
        ),
      ),
    );
  }
}

class _BlobPainter extends CustomPainter {
  final Color color;

  _BlobPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(size.width * 0.5, 0);

    path.cubicTo(
      size.width * 0.85,
      size.height * 0.02,
      size.width,
      size.height * 0.25,
      size.width * 0.88,
      size.height * 0.55,
    );

    path.cubicTo(
      size.width * 0.76,
      size.height * 0.88,
      size.width * 0.45,
      size.height,
      size.width * 0.2,
      size.height * 0.78,
    );

    path.cubicTo(
      -size.width * 0.02,
      size.height * 0.58,
      size.width * 0.08,
      size.height * 0.18,
      size.width * 0.5,
      0,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BlobPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}