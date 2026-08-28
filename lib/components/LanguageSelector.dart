import 'package:citizenapp/bloc/Languagebloc/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LanguageSelector extends StatelessWidget {
  final ShadColorScheme colors;

  const LanguageSelector({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        final bool isFrench = state is LanguageFR;
        final bool isEnglish = state is LanguageENG;

        return Container(
          height: 22,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F1F6),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<LanguageBloc>().add(ChangeLanguage("ENG"));
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: 18,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: isFrench ? colors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'FR',
                    style: TextStyle(
                      color: isFrench ? Colors.white : const Color(0xFF626875),
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 1),

              GestureDetector(
                onTap: () {
                  context.read<LanguageBloc>().add(ChangeLanguage('FR'));
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: 18,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: isEnglish ? colors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'EN',
                    style: TextStyle(
                      color: isEnglish ? Colors.white : const Color(0xFF626875),
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
