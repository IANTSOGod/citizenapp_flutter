import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activateocrcapture_event.dart';
part 'activateocrcapture_state.dart';

class ActivateocrcaptureBloc
    extends Bloc<ActivateocrcaptureEvent, ActivateocrcaptureState> {
  ActivateocrcaptureBloc() : super(ActivateocrcaptureOff()) {
    on<ActivatecaptureMode>((event, emit) {
      if (event.ismodeon == true) {
        emit(ActivateocrcaptureOn());
      } else {
        emit(ActivateocrcaptureOff());
      }
    });

    on<Capturing>((event, emit) {
      emit(ActivateocrcaptureLoading());
    });

    on<Capturebyfile>((event, emit) {
      emit(Activateocrbyfile());
    });

    on<Viewtips>((event, emit) {
      emit(Viewtipsstate());
    });
  }
}
