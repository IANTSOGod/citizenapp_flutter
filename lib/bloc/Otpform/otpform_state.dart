part of 'otpform_bloc.dart';

class OtpformState extends Equatable {
  const OtpformState();

  @override
  List<Object> get props => [];
}

class OtpformInit extends OtpformState {}

class OtpformLoading extends OtpformState {}

class OtpformSucces extends OtpformState {}

class OtpformError extends OtpformState {
  final String message;

  const OtpformError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
