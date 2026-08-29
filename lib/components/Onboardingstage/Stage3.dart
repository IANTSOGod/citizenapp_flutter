import 'package:citizenapp/bloc/onboardingstagingbloc/onboardingstaging_bloc.dart';
import 'package:citizenapp/components/Pageindicator.dart';
import 'package:citizenapp/pages/Accountactivation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Stage3 extends StatelessWidget {
  const Stage3({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PageIndicator(colors: colors),
        SizedBox(height: 52),
        SizedBox(
          width: double.infinity,
          height: 46,
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
              "S'authentifier",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
        ),

        const SizedBox(height: 9),

        SizedBox(
          width: double.infinity,
          height: 46,
          child: ShadButton.outline(
            onPressed: () {
              context.read<OnboardingstagingBloc>().add(ChangeStage(2));
            },
            foregroundColor: colors.primary,
            decoration: ShadDecoration(
              border: ShadBorder.all(color: colors.primary, width: 1),
            ),
            child: const Text(
              'Précédent',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
