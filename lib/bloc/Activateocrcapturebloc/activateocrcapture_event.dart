part of 'activateocrcapture_bloc.dart';

sealed class ActivateocrcaptureEvent extends Equatable {
  const ActivateocrcaptureEvent();

  @override
  List<Object> get props => [];
}

final class ActivatecaptureMode extends ActivateocrcaptureEvent {
  final bool ismodeon;

  const ActivatecaptureMode(this.ismodeon);

  @override
  List<Object> get props => [ismodeon];
}

final class OcrRecognized extends ActivateocrcaptureEvent {
  final Verifyusercincredentials user;

  const OcrRecognized(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

final class Capturing extends ActivateocrcaptureEvent {
  const Capturing();
}

final class Capturebyfile extends ActivateocrcaptureEvent {
  const Capturebyfile();
}

final class Viewtips extends ActivateocrcaptureEvent {
  const Viewtips();
}

// final class CapturingSuccess extends ActivateocrcaptureEvent {
//   final String cin;

//   const CapturingSuccess(this.cin);

//   @override
//   List<Object> get props => [cin];
// }

// final class CapturingError extends ActivateocrcaptureEvent {
//   final String message;

//   const CapturingError(this.message);

//   @override
//   // TODO: implement props
//   List<Object> get props => [message];
// }
