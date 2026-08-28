import 'package:citizenapp/bloc/Stagingblocs/onboardingstaging_bloc.dart';
import 'package:citizenapp/components/CitizenLogo.dart';
import 'package:citizenapp/components/DocumentIllustration.dart';
import 'package:citizenapp/components/LanguageSelector.dart';
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

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CitizenLogo(colors: colors),
            LanguageSelector(colors: colors),
          ],
        ),
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
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ShadButton(
                  onPressed: () {
                    context.read<OnboardingstagingBloc>().add(ChangeStage(2));
                  },
                  backgroundColor: colors.primary,
                  foregroundColor: colors.primaryForeground,

                  child: const Text(
                    'Démarrer l’activation',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              const SizedBox(height: 9),

              SizedBox(
                width: double.infinity,
                height: 46,
                child: ShadButton.outline(
                  onPressed: () {
                    // TODO: connexion
                  },
                  foregroundColor: colors.primary,
                  decoration: ShadDecoration(
                    border: ShadBorder.all(color: colors.primary, width: 1),
                  ),
                  child: const Text(
                    'J’ai déjà un compte',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}
