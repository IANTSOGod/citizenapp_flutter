import 'package:citizenapp/components/IllustrationLine.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Heroillustrationocr extends StatelessWidget {
  const Heroillustrationocr({super.key});

  @override
  Widget build(BuildContext context) {
    final ShadColorScheme colors = ShadTheme.of(context).colorScheme;

    return SizedBox(
      height: 130,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 210,
              height: 120,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.muted,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: colors.background,
                    child: Icon(
                      Icons.person_outline,
                      color: colors.primary,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IllustrationLine(colors: colors, widthFactor: 1),
                        const SizedBox(height: 8),
                        IllustrationLine(colors: colors, widthFactor: 0.75),
                        const SizedBox(height: 8),
                        IllustrationLine(colors: colors, widthFactor: 0.55),
                        const SizedBox(height: 8),
                        IllustrationLine(colors: colors, widthFactor: 0.85),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Badge de succès (couleur sémantique fixe, indépendante du thème)
            Positioned(
              right: -6,
              bottom: -6,
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFF22C55E),
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.background, width: 3),
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
