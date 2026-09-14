import 'package:citizenapp/bloc/onboardingstagingbloc/onboardingstaging_bloc.dart';
import 'package:citizenapp/components/IdentityVisual.dart';
import 'package:citizenapp/components/Pageindicator.dart';
import 'package:citizenapp/pages/Accountactivation.dart';
import 'package:citizenapp/pages/Login.dart';
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
        final velocity = details.primaryVelocity;

        if (velocity == null) return;

        if (velocity > 0) {
          context.read<OnboardingstagingBloc>().add(ChangeStage(2));
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            children: [
              const SizedBox(height: 25),

              // ─────────────────────────────
              // VISUEL
              // ─────────────────────────────
              Expanded(child: IdentityVisual(colors: colors)),

              const SizedBox(height: 10),

              // ─────────────────────────────
              // INDICATEUR
              // ─────────────────────────────
              PageIndicator(colors: colors),

              const SizedBox(height: 28),

              // ─────────────────────────────
              // BOUTON PRINCIPAL
              // ─────────────────────────────
              SizedBox(
                width: double.infinity,
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
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ─────────────────────────────
              // BOUTON SECONDAIRE
              // ─────────────────────────────
              SizedBox(
                width: double.infinity,
                child: ShadButton.outline(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(
                          onBiometricTap: () {},
                          onConnectionIssueTap: () {},
                          onPinTap: () {},
                        ),
                      ),
                    );
                  },
                  foregroundColor: colors.primary,
                  decoration: ShadDecoration(
                    border: ShadBorder.all(color: colors.primary, width: 1),
                  ),
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
