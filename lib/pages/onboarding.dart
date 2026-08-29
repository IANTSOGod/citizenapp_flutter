import 'package:citizenapp/bloc/onboardingstagingbloc/onboardingstaging_bloc.dart';
import 'package:citizenapp/components/CitizenLogo.dart';
import 'package:citizenapp/components/LanguageSelector.dart';
import 'package:citizenapp/components/Onboardingstage/Stage1.dart';
import 'package:citizenapp/components/Onboardingstage/Stage2.dart';
import 'package:citizenapp/components/Onboardingstage/Stage3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: CitizenLogo(colors: colors),
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
      backgroundColor: colors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child:
                      BlocBuilder<
                        OnboardingstagingBloc,
                        OnboardingstagingState
                      >(
                        builder: (context, state) {
                          if (state is Stage) {
                            switch (state.stage) {
                              case 1:
                                return const Stage1();
                              case 2:
                                return const Stage2();
                              case 3:
                                return const Stage3();
                              default:
                                return const Text('Not implemented stage');
                            }
                          }

                          return const Text('Bloc error');
                        },
                      ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
