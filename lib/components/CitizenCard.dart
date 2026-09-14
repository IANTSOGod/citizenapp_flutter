import 'package:citizenapp/components/SkeletonLine.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CitizenCard extends StatelessWidget {
  final ShadColorScheme colors;

  const CitizenCard({required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: colors.background,
        border: Border.all(color: colors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Petit élément graphique dans la carte
          Positioned(
            right: -25,
            top: -25,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primary.withOpacity(0.045),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 19,
                        color: colors.primaryForeground,
                      ),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_outline_rounded,
                            size: 10,
                            color: colors.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "PROTÉGÉ",
                            style: TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                              color: colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                Text(
                  "IDENTITÉ CITOYENNE",
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: colors.mutedForeground,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    SkeletonLine(width: 72, color: colors.foreground),
                    const SizedBox(width: 8),
                    SkeletonLine(width: 45, color: colors.foreground),
                  ],
                ),

                const SizedBox(height: 7),

                SkeletonLine(width: 105, color: colors.mutedForeground),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
