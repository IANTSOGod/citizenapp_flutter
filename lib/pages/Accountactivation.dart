import 'package:citizenapp/bloc/Activationstepbloc/activationstep_bloc.dart';
import 'package:citizenapp/components/Accountactivationstep/Activationstep1.dart';
import 'package:citizenapp/components/Accountactivationstep/Activationstep2.dart';
import 'package:citizenapp/components/Accountactivationstep/Activationstep3.dart';
import 'package:citizenapp/components/ActivationProgressbar.dart';
import 'package:citizenapp/components/LanguageSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Accountactivation extends StatelessWidget {
  const Accountactivation({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
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
      body: BlocBuilder<ActivationstepBloc, ActivationstepState>(
        builder: (context, state) {
          if (state is ActivationstepActive) {
            return Column(
              children: [
                ActivationProgressbar(currentstep: state.step, colors: colors),

                Expanded(
                  child: Center(
                    child: switch (state.step) {
                      1 => const Activationstep1(),
                      2 => const Activationstep2(),
                      3 => const Activationstep3(),
                      _ => const Text("Not implemented step"),
                    },
                  ),
                ),
              ],
            );
          }

          return const Center(child: Text("Bloc error"));
        },
      ),
    );
  }
}
