part of 'onboardingstaging_bloc.dart';

@immutable
sealed class OnboardingstagingEvent extends Equatable {}

final class ChangeStage extends OnboardingstagingEvent {
  final int currentstage;

  ChangeStage(this.currentstage);

  @override
  // TODO: implement props
  List<Object?> get props => [currentstage];
}
