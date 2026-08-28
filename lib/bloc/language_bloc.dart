import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageFR()) {
    on<ChangeLanguage>((event, emit) {
      if (event.currentlanguage == "FR") {
        emit(LanguageENG());
      } else {
        emit(LanguageFR());
      }
    });
  }
}
