part of 'onboardingstaging_bloc.dart';

@immutable
sealed class OnboardingstagingState {}

final class Stage extends OnboardingstagingState {
  final int stage;

  Stage(this.stage);

  List<int> get props => [stage];
}
