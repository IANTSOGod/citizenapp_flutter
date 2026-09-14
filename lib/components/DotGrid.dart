import 'package:flutter/material.dart';

class DotGrid extends StatelessWidget {
  final Color color;

  const DotGrid({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(38, 30),
      painter: _DotGridPainter(color),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  final Color color;

  _DotGridPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    for (var x = 0; x < 4; x++) {
      for (var y = 0; y < 3; y++) {
        canvas.drawCircle(
          Offset(
            x * 10.0,
            y * 10.0,
          ),
          1.5,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}