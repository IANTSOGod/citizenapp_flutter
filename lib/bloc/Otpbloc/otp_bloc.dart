import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(const OtpState()) {
    on<OtpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
