import 'package:citizenapp/bloc/onboardingstagingbloc/onboardingstaging_bloc.dart';
import 'package:citizenapp/components/Pageindicator.dart';
import 'package:citizenapp/pages/Accountactivation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Stage3 extends StatelessWidget {
  const Stage3({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          // swipe vers la droite -> retour à l'étape précédente
          context.read<OnboardingstagingBloc>().add(ChangeStage(2));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageIndicator(colors: colors),
          const SizedBox(height: 52),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: ShadButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Accountactivation(),
                  ),
                );
              },
              backgroundColor: colors.primary,
              foregroundColor: colors.primaryForeground,
              child: const Text(
                "Démarrer l'activation",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
