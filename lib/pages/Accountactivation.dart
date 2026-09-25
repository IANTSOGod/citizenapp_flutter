import 'package:citizenapp/bloc/Activationstepbloc/activationstep_bloc.dart';
import 'package:citizenapp/bloc/OtpExpiry/otp_expiry_bloc.dart';
import 'package:citizenapp/bloc/Otpform/otpform_bloc.dart';
import 'package:citizenapp/components/Accountactivationstep/Activationstep1.dart';
import 'package:citizenapp/components/Accountactivationstep/Activationstep2.dart';
import 'package:citizenapp/components/Accountactivationstep/Activationstep3.dart';
import 'package:citizenapp/components/ActivationProgressbar.dart';
import 'package:citizenapp/components/LanguageSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../Types/Activationdata.dart';
import '../components/Accountactivationstep/Activationstep4.dart';

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
                      2 => MultiBlocProvider(
                        providers: [
                          BlocProvider<OtpformBloc>(
                            create: (_) => OtpformBloc(),
                          ),
                          BlocProvider<OtpExpiryBloc>(
                            create: (_) => OtpExpiryBloc(),
                          ),
                        ],
                        child: Activationstep2(
                          email: state.data.email,
                          cin: state.data.CIN,
                        ),
                      ),
                      3 => Activationstep3(
                        selected: state.data.authMethod,
                        onSelect: (method) =>
                            context.read<ActivationstepBloc>().add(
                              ChangeStep(
                                3,
                                Activationdata(
                                  CIN: state.data.CIN,
                                  email: state.data.email,
                                  authMethod: method,
                                ),
                              ),
                            ),
                      ),
                      4 => Activationstep4(method: state.data.authMethod),
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
