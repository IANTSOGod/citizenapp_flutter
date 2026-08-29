import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class IllustrationLine extends StatelessWidget {
  final ShadColorScheme colors;
  final double widthFactor;

  const IllustrationLine({
    super.key,
    required this.colors,
    required this.widthFactor,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      alignment: Alignment.centerLeft,
      child: Container(
        height: 6,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
