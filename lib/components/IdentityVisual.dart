import 'package:citizenapp/components/Blob.dart';
import 'package:citizenapp/components/CitizenCard.dart';
import 'package:citizenapp/components/ConnectionPainter.dart';
import 'package:citizenapp/components/DotGrid.dart';
import 'package:citizenapp/components/FloatingBadge.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';


class IdentityVisual extends StatelessWidget {
  final ShadColorScheme colors;

  const IdentityVisual({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            // ─────────────────────────────
            // BLOBS D'ARRIÈRE-PLAN
            // ─────────────────────────────
            Positioned(
              top: 55,
              left: -45,
              child: Blob(
                size: 150,
                color: colors.primary.withOpacity(0.045),
                rotation: -0.3,
              ),
            ),

            Positioned(
              top: 120,
              right: -55,
              child: Blob(
                size: 130,
                color: colors.primary.withOpacity(0.035),
                rotation: 0.5,
              ),
            ),

            // ─────────────────────────────
            // PETITS POINTS DÉCORATIFS
            // ─────────────────────────────
            Positioned(
              top: 75,
              right: 35,
              child: DotGrid(color: colors.primary.withOpacity(0.16)),
            ),

            Positioned(
              bottom: 75,
              left: 25,
              child: DotGrid(color: colors.primary.withOpacity(0.10)),
            ),

            // ─────────────────────────────
            // CONNEXIONS
            // ─────────────────────────────
            Positioned.fill(
              child: CustomPaint(
                painter: ConnectionPainter(
                  color: colors.primary.withOpacity(0.13),
                ),
              ),
            ),

            // ─────────────────────────────
            // CARTE CENTRALE
            // ─────────────────────────────
            Center(child: CitizenCard(colors: colors)),

            // ─────────────────────────────
            // BADGE ACTIVATION
            // ─────────────────────────────
            Positioned(
              left: 18,
              bottom: 92,
              child: FloatingBadge(
                icon: Icons.shield_outlined,
                label: "Sécurisé",
                colors: colors,
              ),
            ),

            // ─────────────────────────────
            // BADGE IDENTITÉ
            // ─────────────────────────────
            Positioned(
              right: 15,
              top: 85,
              child: FloatingBadge(
                icon: Icons.verified_outlined,
                label: "Identité",
                colors: colors,
              ),
            ),

            // ─────────────────────────────
            // TITRE
            // ─────────────────────────────
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  Text(
                    "Votre compte citoyen",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: colors.foreground,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Activez votre identité numérique "
                      "ou connectez-vous à votre compte.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.5,
                        height: 1.45,
                        color: colors.mutedForeground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
