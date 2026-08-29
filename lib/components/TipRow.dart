import 'package:citizenapp/Types/Scantype.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TipRow extends StatelessWidget {
  final ScanTip tip;
  final ShadColorScheme colors;

  const TipRow({required this.tip, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colors.muted,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(tip.icon, color: colors.primary, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            tip.text,
            style: TextStyle(
              color: colors.foreground,
              fontSize: 14,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
