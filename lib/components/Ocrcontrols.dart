import 'package:citizenapp/bloc/Activateocrcapturebloc/activateocrcapture_bloc.dart';
import 'package:citizenapp/components/CaptureButton.dart';
import 'package:citizenapp/components/RoundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Ocrcontrols extends StatelessWidget {
  final ShadColorScheme colors;
  const Ocrcontrols({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundIconButton(
          icon: Icons.photo_library_outlined,
          label: "Galerie",
          colors: colors,
          onTap: () {
            context.read<ActivateocrcaptureBloc>().add(Capturebyfile());
          },
        ),
        const SizedBox(width: 40),
        CaptureButton(colors: colors, onTap: () {}),
        const SizedBox(width: 40),
        RoundIconButton(
          icon: Icons.lightbulb_outline,
          label: "Conseils",
          colors: colors,
          onTap: () {
            context.read<ActivateocrcaptureBloc>().add(Viewtips());
          },
        ),
      ],
    );
  }
}
