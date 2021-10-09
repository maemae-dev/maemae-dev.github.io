import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/state/theme_mode_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('ja'),
      routerDelegate: useProvider(router).routerDelegate,
      routeInformationParser: useProvider(router).routeInformationParser,
      title: 'Kazuma Maekawa',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
        primarySwatch: Colors.deepPurple,
      ),
      themeMode: useProvider(themeModeProvider).mode, //themeMode.mode,
      darkTheme: ThemeData.dark().copyWith(
        toggleableActiveColor: Colors.deepPurple[200],
        textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
