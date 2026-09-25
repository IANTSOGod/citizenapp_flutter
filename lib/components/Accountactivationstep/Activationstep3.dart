import 'package:citizenapp/Types/Activationdata.dart';
import 'package:citizenapp/bloc/Activationstepbloc/activationstep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../Types/AuthMethod.dart';

class Activationstep3 extends StatelessWidget {
  const Activationstep3({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  final AuthMethod selected;
  final ValueChanged<AuthMethod> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            _HeaderIcon(colors: colors),
            const SizedBox(height: 20),
            Text(
              'Sécurisation du Compte',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: colors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Choisissez votre méthode d'authentification\npour protéger vos documents.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                color: colors.mutedForeground,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            _OptionCard(
              colors: colors,
              method: AuthMethod.pin,
              icon: Icons.pin_outlined,
              title: 'Code PIN',
              subtitle: 'Créez un code secret à 4 chiffres',
              isSelected: selected == AuthMethod.pin,
              onTap: () => onSelect(AuthMethod.pin),
            ),
            const SizedBox(height: 14),
            _OptionCard(
              colors: colors,
              method: AuthMethod.biometrie,
              icon: Icons.fingerprint,
              title: 'Biométrie',
              subtitle: 'Utilisez votre empreinte ou FaceID',
              isSelected: selected == AuthMethod.biometrie,
              onTap: () => onSelect(AuthMethod.biometrie),
            ),
            const Spacer(),
            _InfoBanner(colors: colors),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<ActivationstepBloc, ActivationstepState>(
                builder: (context, state) {
                  if (state is ActivationstepActive) {
                    return ShadButton(
                      backgroundColor: const Color(0xFF004B87),
                      foregroundColor: Colors.white,
                      onPressed: () {
                        context.read<ActivationstepBloc>().add(
                          ChangeStep(
                            4,
                            Activationdata(
                              CIN: state.data.CIN,
                              email: state.data.email,
                              authMethod: selected,
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Suivant',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(LucideIcons.arrowRight, size: 14),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({required this.colors});

  final ShadColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: colors.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.verified_user_outlined,
          color: colors.primary,
          size: 32,
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.colors,
    required this.method,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final ShadColorScheme colors;
  final AuthMethod method;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary.withOpacity(0.08) : colors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? colors.primary : colors.border,
            width: isSelected ? 1.6 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.border),
              ),
              child: Icon(icon, color: colors.primary, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: colors.foreground,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.5,
                      color: colors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? colors.primary : colors.border,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  const _InfoBanner({required this.colors});

  final ShadColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.muted,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.sync, color: colors.primary, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: colors.mutedForeground,
                  height: 1.4,
                ),
                children: const [
                  TextSpan(
                    text:
                        "Ces méthodes sécurisent l'accès à vos documents officiels. ",
                  ),
                  TextSpan(
                    text:
                        'Votre choix pourra être modifié ultérieurement '
                        'dans les paramètres.',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
