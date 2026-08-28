import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'onboardingstaging_event.dart';
part 'onboardingstaging_state.dart';

class OnboardingstagingBloc
    extends Bloc<OnboardingstagingEvent, OnboardingstagingState> {
  OnboardingstagingBloc() : super(Stage(1)) {
    on<ChangeStage>((event, emit) {
      emit(Stage(event.currentstage));
    });
  }
}
