part of 'otp_expiry_bloc.dart';

sealed class OtpExpiryEvent extends Equatable {
  const OtpExpiryEvent();

  @override
  List<Object> get props => [];
}

class Resendcode extends OtpExpiryEvent {
  final String email;

  const Resendcode(this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class OtpTick extends OtpExpiryEvent {
  final int duration;
  const OtpTick(this.duration);

  @override
  List<Object> get props => [duration];
}
