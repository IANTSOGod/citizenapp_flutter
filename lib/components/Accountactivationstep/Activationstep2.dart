import 'package:citizenapp/bloc/Activationstepbloc/activationstep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Activationstep2 extends StatelessWidget {
  const Activationstep2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          // Icône email
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: Color(0xFFE1ECFF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              LucideIcons.mail,
              size: 21,
              color: Color(0xFF004B87),
            ),
          ),

          const SizedBox(height: 14),

          // Titre
          const Text(
            'Envoi OTP par e-mail',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF17191D),
            ),
          ),

          const SizedBox(height: 10),

          // Description
          Text(
            "Un code d'activation a été envoyé à\n"
            "l'adresse e-mail associée à votre identité.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              height: 1.45,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 10),

          // Email masqué
          const Text(
            'a•••@email.mg',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333840),
            ),
          ),

          const SizedBox(height: 22),

          // Label
          Align(
            alignment: Alignment.center,
            child: Text(
              'Saisissez le code à 6 chiffres',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
            ),
          ),

          const SizedBox(height: 8),

          // Champs OTP
          ShadInputOTP(
            onChanged: (v) => print('OTP: $v'),
            maxLength: 6,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            children: const [
              ShadInputOTPGroup(
                children: [
                  ShadInputOTPSlot(),
                  ShadInputOTPSlot(),
                  ShadInputOTPSlot(),
                  ShadInputOTPSlot(),
                  ShadInputOTPSlot(),
                  ShadInputOTPSlot(),
                ],
              ),
            ],
          ),

          const SizedBox(height: 55),

          // Renvoyer le code
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LucideIcons.refreshCw, size: 9, color: Colors.grey.shade500),
              const SizedBox(width: 4),
              Text(
                'Renvoyer le code (0:58)',
                style: TextStyle(fontSize: 7, color: Colors.grey.shade500),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 22),
          // Bouton Suivant
          SizedBox(
            width: double.infinity,
            child: ShadButton(
              backgroundColor: const Color(0xFF004B87),
              foregroundColor: Colors.white,
              onPressed: () {
                context.read<ActivationstepBloc>().add(ChangeStep(3));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Suivant',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 6),
                  Icon(LucideIcons.arrowRight, size: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
