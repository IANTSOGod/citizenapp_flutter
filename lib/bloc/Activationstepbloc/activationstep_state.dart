part of 'activationstep_bloc.dart';

sealed class ActivationstepState extends Equatable {
  const ActivationstepState();

  @override
  List<Object> get props => [];
}

final class ActivationstepActive extends ActivationstepState {
  final int step;

  const ActivationstepActive(this.step);

  @override
  // TODO: implement props
  List<Object> get props => [step];
}
