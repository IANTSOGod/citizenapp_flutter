part of 'activateocrcapture_bloc.dart';

sealed class ActivateocrcaptureState extends Equatable {
  const ActivateocrcaptureState();

  @override
  List<Object> get props => [];
}

final class ActivateocrcaptureOn extends ActivateocrcaptureState {}

final class ActivateocrcaptureOff extends ActivateocrcaptureState {}

final class ActivateocrcaptureLoading extends ActivateocrcaptureState {}

final class ActivateocrcaptureSuccess extends ActivateocrcaptureState {
  final String cin;

  const ActivateocrcaptureSuccess(this.cin);

  @override
  // TODO: implement props
  List<Object> get props => [cin];
}

final class ActivateocrcaptureError extends ActivateocrcaptureState {
  final String message;

  const ActivateocrcaptureError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

final class Activateocrbyfile extends ActivateocrcaptureState {}

final class Viewtipsstate extends ActivateocrcaptureState {}
