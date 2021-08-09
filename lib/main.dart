import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/providers/theme_mode_provider.dart';
import 'package:portfolio/routes.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('ja'),
      routerDelegate: useProvider(routerDelegate),
      routeInformationParser: useProvider(parser),
      title: 'Flutter Demo',
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
