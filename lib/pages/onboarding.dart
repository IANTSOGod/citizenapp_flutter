import 'package:citizenapp/bloc/Stagingblocs/onboardingstaging_bloc.dart';
import 'package:citizenapp/components/Onboardingstage/Stage1.dart';
import 'package:citizenapp/components/Onboardingstage/Stage2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return Scaffold(
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
                            if (state.stage == 1) {
                              return Stage1();
                            } else if (state.stage == 2) {
                              return Stage2();
                            } else {
                              return Text("Not implemented stage");
                            }
                          } else {
                            return Text("Bloc error");
                          }
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
