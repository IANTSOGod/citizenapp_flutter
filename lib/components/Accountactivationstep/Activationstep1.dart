import 'package:citizenapp/components/CardCIN.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Activationstep1 extends StatelessWidget {
  const Activationstep1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icône
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: Color(0xFFE1ECFF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              LucideIcons.briefcaseBusiness,
              size: 20,
              color: Color(0xFF9DBBEA),
            ),
          ),

          const SizedBox(height: 14),

          // Titre
          const Text(
            "Saisissez votre numéro\nd'identité",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              height: 1.15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF17191D),
            ),
          ),

          const SizedBox(height: 12),

          // Description
          Text(
            "Veuillez entrer votre Numéro de Carte\n"
            "d'Identité Nationale (CIN) pour commencer\n"
            "l'activation de votre compte.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9,
              height: 1.45,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 25),
          CardCIN(),
          
          const SizedBox(height: 18),

          // Sécurité
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.lockKeyhole,
                size: 9,
                color: Colors.grey.shade500,
              ),
              const SizedBox(width: 4),
              Text(
                "Vos données sont sécurisées par l'État Malagasy",
                style: TextStyle(fontSize: 7, color: Colors.grey.shade500),
              ),
            ],
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
