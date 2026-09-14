import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_expiry_event.dart';
part 'otp_expiry_state.dart';

class OtpExpiryBloc extends Bloc<OtpExpiryEvent, OtpExpiryState> {
  static const int _initialDuration = 60;
  Timer? _timer;

  OtpExpiryBloc() : super(OtpExpiredInit(_initialDuration)) {
    on<Resendcode>((event, emit) {
      // TODO: implement event handler
      if (event.email == "iantsochristian@gmail.com") {
        emit(OtpExpiredInit(_initialDuration));
        _startTimer();
      }
    });
    on<OtpTick>((event, emit) {
      if (event.duration <= 0) {
        _timer?.cancel();
        emit(OtpExpired());
      } else {
        emit(OtpExpiredInit(event.duration));
      }
    });
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    int remaining = _initialDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remaining--;
      add(OtpTick(remaining));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
