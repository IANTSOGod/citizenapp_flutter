import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final ShadColorScheme colors;
  final VoidCallback onTap;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: colors.muted,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: colors.primary, size: 24),
          ),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(color: colors.primary, fontSize: 12)),
        ],
      ),
    );
  }
}
