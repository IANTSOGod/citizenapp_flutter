part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class Otpsubmitted extends OtpEvent {
  final String otp;

  const Otpsubmitted({required this.otp});

  @override
  List<Object> get props => [otp];
}

class OtpCodesend extends OtpEvent {
  final int duration;

  const OtpCodesend({required this.duration});

  @override
  List<Object> get props => [duration];
}
