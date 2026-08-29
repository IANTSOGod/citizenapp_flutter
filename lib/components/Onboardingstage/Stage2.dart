import 'package:citizenapp/bloc/onboardingstagingbloc/onboardingstaging_bloc.dart';
import 'package:citizenapp/components/Pageindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Stage2 extends StatelessWidget {
  const Stage2({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity == null) return;

        if (details.primaryVelocity! < 0) {
          // swipe vers la gauche -> étape suivante
          context.read<OnboardingstagingBloc>().add(ChangeStage(3));
        } else if (details.primaryVelocity! > 0) {
          // swipe vers la droite -> étape précédente
          context.read<OnboardingstagingBloc>().add(ChangeStage(1));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageIndicator(colors: colors),
          const SizedBox(height: 52),
          Text("Stage 2"),
        ],
      ),
    );
  }
}
