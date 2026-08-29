import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ActivationProgressbar extends StatelessWidget {
  final int currentstep;
  final ShadColorScheme colors;
  const ActivationProgressbar({
    super.key,
    required this.currentstep,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final labels = ['Identité', 'Saisie du code otp', 'test'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Etape $currentstep sur 5",
                style: TextStyle(fontSize: 9, color: Colors.grey.shade700),
              ),
              Text(
                labels[currentstep - 1],
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: colors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width,
            ),
            child: ShadProgress(value: currentstep / 5),
          ),
        ],
      ),
    );
  }
}
