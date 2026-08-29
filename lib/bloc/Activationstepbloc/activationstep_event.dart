part of 'activationstep_bloc.dart';

sealed class ActivationstepEvent extends Equatable {
  const ActivationstepEvent();

  @override
  List<Object> get props => [];
}

final class ChangeStep extends ActivationstepEvent {
  final int step;

  const ChangeStep(this.step);

  @override
  // TODO: implement props
  List<Object> get props => [step];
}
