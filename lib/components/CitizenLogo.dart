import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CitizenLogo extends StatelessWidget {
  final ShadColorScheme colors;

  const CitizenLogo({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: colors.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.verified_user_rounded,
            color: Colors.white,
            size: 13,
          ),
        ),
      ],
    );
  }
}
