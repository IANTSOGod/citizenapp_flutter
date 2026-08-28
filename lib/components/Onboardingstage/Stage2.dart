import 'package:citizenapp/components/Pageindicator.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Stage2 extends StatelessWidget {
  const Stage2({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [PageIndicator(colors: colors,)],
    );
  }
}
