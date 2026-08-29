import 'package:citizenapp/bloc/Activateocrcapturebloc/activateocrcapture_bloc.dart';
import 'package:citizenapp/bloc/Activationstepbloc/activationstep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CardCIN extends StatelessWidget {
  const CardCIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadCard(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Numéro de CIN',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 7),

              ShadInput(
                placeholder: const Text(
                  'Ex: 123 456 789 012',
                  style: TextStyle(fontSize: 11, color: Color(0xFF9AA0AA)),
                ),
                trailing: SizedBox(
                  width: 20,
                  height: 20,
                  child: IconButton.outlined(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.read<ActivateocrcaptureBloc>().add(
                        ActivatecaptureMode(true),
                      );
                    },
                    icon: const Icon(LucideIcons.scanLine, size: 14),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 7),

              Row(
                children: [
                  const Icon(
                    LucideIcons.info,
                    size: 10,
                    color: Color(0xFF555B65),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      "12 chiffres figurent sur votre carte d'identité.",
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        // Bouton Suivant
        SizedBox(
          width: double.infinity,
          child: ShadButton(
            backgroundColor: const Color(0xFF004B87),
            foregroundColor: Colors.white,
            onPressed: () {
              context.read<ActivationstepBloc>().add(ChangeStep(2));
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
    );
  }
}
