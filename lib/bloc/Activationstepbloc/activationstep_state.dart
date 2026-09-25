part of 'activationstep_bloc.dart';

sealed class ActivationstepState extends Equatable {
  const ActivationstepState();

  @override
  List<Object> get props => [];
}

final class ActivationstepActive extends ActivationstepState {
  final int step;
  final Activationdata data;
  const ActivationstepActive(this.step, this.data);

  @override
  // TODO: implement props
  List<Object> get props => [step, data];
}
