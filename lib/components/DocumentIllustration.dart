import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DocumentIllustration extends StatelessWidget {
  final ShadColorScheme colors;

  const DocumentIllustration({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 116,
      height: 116,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Outer circle
          Container(
            width: 116,
            height: 116,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FC),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),

          // Document
          Container(
            width: 40,
            height: 31,
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Stack(
              children: [
                // Bandeau supérieur
                Positioned(
                  left: 5,
                  right: 5,
                  top: 6,
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Ligne du milieu
                Positioned(
                  left: 7,
                  right: 7,
                  top: 13,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Petite ligne
                Positioned(
                  left: 7,
                  right: 16,
                  top: 19,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Badge sécurité
          Positioned(
            right: -3,
            bottom: -2,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x18000000),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: colors.muted,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.verified_rounded,
                    color: colors.mutedForeground,
                    size: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
