import 'package:citizenapp/components/CornerFramePainter.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Imagecapture extends StatelessWidget {
  final ShadColorScheme colors;
  const Imagecapture({super.key,required this.colors});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.58, // ratio approximatif d'une carte d'identité
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Stack(
            children: [
              // Zone de la carte (placeholder, remplaçable par une preview caméra)
              Positioned.fill(
                child: Container(
                  margin: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: colors.muted,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              // Coins du cadre
              Positioned.fill(
                child: CustomPaint(
                  painter: CornerFramePainter(color: colors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
