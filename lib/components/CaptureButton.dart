import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CaptureButton extends StatelessWidget {
  final ShadColorScheme colors;
  final VoidCallback onTap;

  const CaptureButton({required this.colors, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        height: 72,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: colors.muted, width: 3),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.primary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
