import 'package:citizenapp/components/Imagecapture.dart';
import 'package:citizenapp/components/Ocrcontrols.dart';
import 'package:citizenapp/components/TipCard.dart';
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
          Column(
            children: [
              Imagecapture(colors: colors),
              const SizedBox(height: 24),
              Ocrcontrols(colors: colors),
            ],
          ),
          const SizedBox(height: 20),
          TipCard(
            text:
                "Assurez-vous que toutes les informations sont visibles et non floues.",
            colors: colors,
          ),
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
}
