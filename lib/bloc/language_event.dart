part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent {}

final class ChangeLanguage extends LanguageEvent {
  final String currentlanguage;

  ChangeLanguage(this.currentlanguage);
}
