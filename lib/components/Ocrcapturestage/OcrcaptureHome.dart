import 'package:citizenapp/components/CornerFramePainter.dart';
import 'package:citizenapp/components/Ocrcontrols.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Ocrcapturehome extends StatelessWidget {
  const Ocrcapturehome({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return ColoredBox(
      color: colors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          _buildHeader(colors),
          const SizedBox(height: 32),
          _buildFrame(colors),
          const SizedBox(height: 24),
          Ocrcontrols(colors: colors),
          const SizedBox(height: 20),
          _buildFooterHint(colors),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildHeader(ShadColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Text(
            "Placez votre carte d'identité\nà l'intérieur du cadre",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Le numéro sera détecté automatiquement",
            textAlign: TextAlign.center,
            style: TextStyle(color: colors.mutedForeground, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildFrame(ShadColorScheme colors) {
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

  Widget _buildFooterHint(ShadColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.shield_outlined, size: 16, color: colors.mutedForeground),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "Assurez-vous que toutes les informations sont visibles et non floues.",
              style: TextStyle(color: colors.mutedForeground, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
