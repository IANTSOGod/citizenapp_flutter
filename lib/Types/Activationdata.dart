import 'package:citizenapp/Types/AuthMethod.dart';

class Activationdata {
  final int CIN;
  final String email;
  final AuthMethod authMethod;

  const Activationdata({required this.CIN, required this.email,required this.authMethod});
}
