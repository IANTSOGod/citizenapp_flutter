import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CitizenLogo extends StatelessWidget {
  final ShadColorScheme colors;

  const CitizenLogo({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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

        const SizedBox(width: 4),

        Text(
          'Citizen App',
          style: TextStyle(
            color: colors.primary,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}
