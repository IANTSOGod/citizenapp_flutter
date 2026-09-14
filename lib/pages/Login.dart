import 'package:citizenapp/components/CitizenLogo.dart';
import 'package:citizenapp/components/LanguageSelector.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Carte d'authentification biométrique (sans le header "Citizen App").
/// Utilise ShadTheme.of(context) pour toutes les couleurs.
class Login extends StatelessWidget {
  const Login({
    super.key,
    required this.onBiometricTap,
    required this.onPinTap,
    required this.onConnectionIssueTap,
  });

  final VoidCallback onBiometricTap;
  final VoidCallback onPinTap;
  final VoidCallback onConnectionIssueTap;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: CitizenLogo(colors: colors),
        title: Text(
          'Citizen App',
          style: TextStyle(
            color: colors.primary,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        actions: [LanguageSelector(colors: colors)],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              // Force le contenu à occuper au moins toute la hauteur
              // disponible, sinon Center() ne centre pas dans un ScrollView.
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenue',
                      style: theme.textTheme.h2.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Veuillez vous authentifier pour accéder à\nvotre espace numérique sécurisé.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.p.copyWith(
                        color: theme.colorScheme.mutedForeground,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ShadCard(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: onBiometricTap,
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.colorScheme.primary.withOpacity(
                                  0.1,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.colorScheme.primary,
                                ),
                                child: Icon(
                                  Icons.fingerprint,
                                  size: 48,
                                  color: theme.colorScheme.primaryForeground,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "S'authentifier par biométrie",
                            style: theme.textTheme.h4.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Utilisez votre empreinte digitale ou\nFaceID',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.muted,
                          ),
                          const SizedBox(height: 20),
                          Divider(color: theme.colorScheme.border),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: onPinTap,
                            behavior: HitTestBehavior.opaque,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.dialpad,
                                    size: 18,
                                    color: theme.colorScheme.mutedForeground,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Utiliser le code PIN',
                                    style: theme.textTheme.small.copyWith(
                                      color: theme.colorScheme.mutedForeground,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: onConnectionIssueTap,
                      child: Text(
                        'Problème de connexion ?',
                        style: theme.textTheme.small.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
