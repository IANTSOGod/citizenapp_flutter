import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SecurityBadge extends StatelessWidget {
  final ShadColorScheme colors;

  const SecurityBadge({required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      padding: const EdgeInsets.symmetric(horizontal: 11),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F1F6),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lock_rounded, size: 10, color: colors.primary),

          const SizedBox(width: 5),

          Text(
            'CHIFFREMENT DE NIVEAU BANCAIRE',
            style: TextStyle(
              color: colors.foreground,
              fontSize: 7,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.15,
            ),
          ),
        ],
      ),
    );
  }
}
