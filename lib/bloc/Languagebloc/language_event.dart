part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent extends Equatable {}

final class ChangeLanguage extends LanguageEvent {
  final String currentlanguage;

  ChangeLanguage(this.currentlanguage);

  @override
  List<Object?> get props => [currentlanguage];
}
