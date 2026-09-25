import 'package:citizenapp/Types/AuthMethod.dart';
import 'package:flutter/material.dart';

class Activationstep4 extends StatelessWidget {
  final AuthMethod method;
  const Activationstep4({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(method == AuthMethod.pin ? "PIN" : "Biometrie"));
  }
}
