import 'package:citizenapp/bloc/onboardingstagingbloc/onboardingstaging_bloc.dart';
import 'package:citizenapp/components/Pageindicator.dart';
import 'package:citizenapp/components/SecurityBadge.dart';
import 'package:citizenapp/components/Stage2Illustration.dart';
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
        final velocity = details.primaryVelocity;

        if (velocity == null) return;

        if (velocity < 0) {
          context.read<OnboardingstagingBloc>().add(ChangeStage(3));
        } else if (velocity > 0) {
          context.read<OnboardingstagingBloc>().add(ChangeStage(1));
        }
      },
      child: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),

            // Illustration
            const Stage2illustration(),

            const SizedBox(height: 42),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Une identité citoyenne,\nsimplement.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  height: 1.18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.45,
                  color: colors.foreground,
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Text(
                "Une identité numérique unique pour "
                "accéder facilement à vos services citoyens.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  color: colors.mutedForeground,
                ),
              ),
            ),

            const Spacer(flex: 4),

            // Page indicator
            PageIndicator(colors: colors),

            const SizedBox(height: 38),

            // Security badge
            SecurityBadge(colors: colors),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
