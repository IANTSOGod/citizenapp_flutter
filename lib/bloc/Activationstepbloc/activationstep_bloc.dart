import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activationstep_event.dart';
part 'activationstep_state.dart';

class ActivationstepBloc
    extends Bloc<ActivationstepEvent, ActivationstepState> {
  ActivationstepBloc() : super(ActivationstepActive(1)) {
    on<ChangeStep>((event, emit) {
      emit(ActivationstepActive(event.step));
    });
  }
}
