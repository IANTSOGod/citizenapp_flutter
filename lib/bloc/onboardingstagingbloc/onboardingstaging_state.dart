part of 'onboardingstaging_bloc.dart';

@immutable
sealed class OnboardingstagingState extends Equatable {}

final class Stage extends OnboardingstagingState {
  final int stage;

  Stage(this.stage);

  @override
  // TODO: implement props
  List<Object?> get props => [stage];
}
