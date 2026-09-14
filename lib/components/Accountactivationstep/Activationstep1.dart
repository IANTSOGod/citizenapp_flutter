import 'package:citizenapp/components/Contentcininput.dart';
import 'package:flutter/material.dart';

class Activationstep1 extends StatelessWidget {
  const Activationstep1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Contentcininput(),
    );
  }
}
