import 'package:citizenapp/bloc/onboardingstagingbloc/onboardingstaging_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PageIndicator extends StatelessWidget {
  final ShadColorScheme colors;

  const PageIndicator({required this.colors});

  @override
  Widget build(BuildContext context) {
    final widgetalign = [
      [
        Container(
          width: 14,
          height: 4,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 5),
        _dot(),
        const SizedBox(width: 5),
        _dot(),
      ],
      [
        _dot(),
        const SizedBox(width: 5),
        Container(
          width: 14,
          height: 4,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 5),
        _dot(),
      ],
      [
        _dot(),
        const SizedBox(width: 5),
        _dot(),
        const SizedBox(width: 5),
        Container(
          width: 14,
          height: 4,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    ];

    return BlocBuilder<OnboardingstagingBloc, OnboardingstagingState>(
      builder: (context, state) {
        if (state is Stage) {
          final currentstage = state.stage;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgetalign[currentstage - 1],
          );
        } else {
          return Text("Bloc error");
        }
      },
    );
  }

  Widget _dot() {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: Color(0xFFD9DCE5),
        shape: BoxShape.circle,
      ),
    );
  }
}
