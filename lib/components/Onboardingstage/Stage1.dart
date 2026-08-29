import 'package:citizenapp/bloc/onboardingstagingbloc/onboardingstaging_bloc.dart';
import 'package:citizenapp/components/DocumentIllustration.dart';
import 'package:citizenapp/components/Pageindicator.dart';
import 'package:citizenapp/components/SecurityBadge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Stage1 extends StatelessWidget {
  const Stage1({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
          context.read<OnboardingstagingBloc>().add(ChangeStage(2));
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const Spacer(),
                DocumentIllustration(colors: colors),
                const SizedBox(height: 34),
                Text(
                  'Vos documents officiels,\ndans votre poche.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.foreground,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Accédez à votre carte d’identité,\n'
                  'permis de conduire et autres\n'
                  'documents essentiels en un seul\n'
                  'endroit sécurisé.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.mutedForeground,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                  ),
                ),
                const Spacer(),
                PageIndicator(colors: colors),
                const SizedBox(height: 36),
                SecurityBadge(colors: colors),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
