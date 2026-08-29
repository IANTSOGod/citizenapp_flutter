import 'package:citizenapp/components/DashedRRectPainter.dart';
import 'package:citizenapp/components/TipCard.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OcrImagePickerCard extends StatelessWidget {
  const OcrImagePickerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return ColoredBox(
      color: colors.background,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Sélectionnez une image claire\nde votre carte d'identité",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 24),
            _buildPickerButton(colors),
            const SizedBox(height: 20),
            TipCard(
              text:
                  'Utilisez une image nette et complète pour de meilleurs résultats.',
              colors: colors,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerButton(ShadColorScheme colors) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: CustomPaint(
        painter: DashedRRectPainter(color: colors.primary),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            color: colors.muted,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: colors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.image_outlined,
                  color: colors.primary,
                  size: 28,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Appuyez pour sélectionner\nune image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colors.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'PNG, JPG ou JPEG — Max 5MB',
                textAlign: TextAlign.center,
                style: TextStyle(color: colors.mutedForeground, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
