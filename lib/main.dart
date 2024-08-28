import 'package:appgeekhome/config/service_locator.dart';
import 'package:appgeekhome/config/theme/app_theme.dart';
import 'package:appgeekhome/domain/bloc/blocs.dart';
import 'package:appgeekhome/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeBloc>()),
        BlocProvider(create: (context) => getIt<ComicDetailBloc>()),
      ],
      child: MaterialApp(
        title: "Geek Home",
        theme: AppTheme().getTheme(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es', 'ES'),
          Locale('en', 'US'),
        ],
        home: const Home(),
      ),
    );
  }
}
