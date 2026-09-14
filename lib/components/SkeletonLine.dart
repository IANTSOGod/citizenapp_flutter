import 'package:flutter/material.dart';

class SkeletonLine extends StatelessWidget {
  final double width;
  final Color color;

  const SkeletonLine({required this.width, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 4,
      decoration: BoxDecoration(
        color: color.withOpacity(0.65),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
