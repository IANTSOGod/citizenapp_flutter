part of 'onboardingstaging_bloc.dart';

@immutable
sealed class OnboardingstagingEvent {}

final class ChangeStage extends OnboardingstagingEvent {
  final int currentstage;

  ChangeStage(this.currentstage);
}
