part of 'otp_expiry_bloc.dart';

class OtpExpiryState extends Equatable {
  const OtpExpiryState();

  @override
  List<Object> get props => [];
}

class OtpExpiredInit extends OtpExpiryState {
  final int duration;
  const OtpExpiredInit(this.duration);

  @override
  // TODO: implement props
  List<Object> get props => [duration];
}

class OtpExpired extends OtpExpiryState {}
