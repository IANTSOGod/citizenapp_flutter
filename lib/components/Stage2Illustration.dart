import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Stage2illustration extends StatelessWidget {
  const Stage2illustration();

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return SizedBox(
      width: 170,
      height: 170,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Cercle principal
          Container(
            decoration: BoxDecoration(
              color: colors.background,
              border: Border.all(color: colors.border, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
          ),

          // Carte
          Container(
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: colors.primary.withOpacity(0.18),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: [
                  // Photo
                  Container(
                    width: 24,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 17,
                      color: colors.primary,
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Informations
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _CardLine(width: 30),
                        const SizedBox(height: 5),
                        _CardLine(width: 36),
                        const SizedBox(height: 5),
                        _CardLine(width: 22),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Badge sécurité
          Positioned(
            right: 8,
            bottom: 10,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.background,
                border: Border.all(color: colors.border, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.verified_user_rounded,
                size: 21,
                color: colors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardLine extends StatelessWidget {
  final double width;

  const _CardLine({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 3,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
