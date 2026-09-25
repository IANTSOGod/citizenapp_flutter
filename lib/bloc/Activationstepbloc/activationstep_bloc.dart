// ignore_for_file: void_checks

import 'package:bloc/bloc.dart';
import 'package:citizenapp/Types/Activationdata.dart';
import 'package:equatable/equatable.dart';

part 'activationstep_event.dart';
part 'activationstep_state.dart';

class ActivationstepBloc
    extends Bloc<ActivationstepEvent, ActivationstepState> {
  String usermail = "";

  ActivationstepBloc()
    : super(ActivationstepActive(1, Activationdata(CIN: 0, email: ""))) {
    on<ChangeStep>((event, emit) {
      emit(ActivationstepActive(event.step, event.data));
    });
  }
}
