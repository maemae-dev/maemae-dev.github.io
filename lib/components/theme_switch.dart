import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/state/theme_mode_provider.dart';

class ThemeSwitch extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: context.read(themeModeProvider).isDarkMode(context),
        onChanged: (value) =>
            context.read(themeModeProvider.notifier).toggleTheme(context));
  }
}
