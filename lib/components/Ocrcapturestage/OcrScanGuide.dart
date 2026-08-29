import 'package:citizenapp/Types/Scantype.dart';
import 'package:citizenapp/bloc/Activateocrcapturebloc/activateocrcapture_bloc.dart';
import 'package:citizenapp/components/HeroIllustrationocr.dart';
import 'package:citizenapp/components/TipRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OcrScanGuide extends StatelessWidget {
  const OcrScanGuide({super.key});

  static const List<ScanTip> _tips = [
    ScanTip(
      icon: Icons.crop_landscape_outlined,
      text: 'Placez la carte sur une surface plane et sombre.',
    ),
    ScanTip(
      icon: Icons.visibility_outlined,
      text: 'Assurez-vous que toutes les informations sont visibles.',
    ),
    ScanTip(
      icon: Icons.wb_sunny_outlined,
      text: 'Évitez les reflets et la lumière directe.',
    ),
    ScanTip(
      icon: Icons.phone_android_outlined,
      text: 'Maintenez votre appareil stable.',
    ),
  ];

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
              'Comment bien scanner ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            for (final tip in _tips) ...[
              TipRow(tip: tip, colors: colors),
              const SizedBox(height: 14),
            ],
            const SizedBox(height: 8),
            Heroillustrationocr(),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ShadButton(
                onPressed: () {
                  context.read<ActivateocrcaptureBloc>().add(
                    ActivatecaptureMode(true),
                  );
                },
                backgroundColor: colors.primary,
                foregroundColor: colors.primaryForeground,
                child: const Text(
                  "J'ai compris",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
