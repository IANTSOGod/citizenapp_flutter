import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otpform_event.dart';
part 'otpform_state.dart';

class OtpformBloc extends Bloc<OtpformEvent, OtpformState> {
  OtpformBloc() : super(OtpformInit()) {
    on<OtpformSend>((event, emit) {
      if (event.otp == 123456) {
        emit(OtpformSucces());
      } else {
        emit(OtpformError("Erreur "));
      }
    });
  }
}
