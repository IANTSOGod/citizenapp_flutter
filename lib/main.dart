import 'package:citizenapp/bloc/Activationstepbloc/activationstep_bloc.dart';
import 'package:citizenapp/bloc/onboardingstagingbloc/onboardingstaging_bloc.dart';
import 'package:citizenapp/bloc/Languagebloc/language_bloc.dart';
import 'package:citizenapp/pages/onboarding.dart';
import 'package:citizenapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (_) => LanguageBloc()),
        BlocProvider<OnboardingstagingBloc>(
          create: (_) => OnboardingstagingBloc(),
        ),
        BlocProvider<ActivationstepBloc>(create: (_)=>ActivationstepBloc(),)
      ],
      child: ShadApp(
        debugShowCheckedModeBanner: false,

        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,

        home: const Onboarding(),
      ),
    );
  }
}
