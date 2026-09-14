part of 'otpform_bloc.dart';

sealed class OtpformEvent extends Equatable {
  const OtpformEvent();

  @override
  List<Object> get props => [];
}

class OtpformSend extends OtpformEvent{
  final int otp;
  final String email;

  const OtpformSend(this.otp,this.email);

  @override
    // TODO: implement props
    List<Object> get props => [otp,email];
}
