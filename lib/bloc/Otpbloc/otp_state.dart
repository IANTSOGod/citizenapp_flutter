part of 'otp_bloc.dart';

class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInit extends OtpState {}

class OtpCodecountdown extends OtpState {
  final int duration;

  const OtpCodecountdown({required this.duration});

  @override
  List<Object> get props => [duration];
}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {}

class OtpError extends OtpState {
  final String message;

  const OtpError({required this.message});

  @override
  List<Object> get props => [message];
}
