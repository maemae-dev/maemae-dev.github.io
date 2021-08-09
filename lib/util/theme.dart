import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ThemeData useTheme() {
  return use(_ThemeHook());
}

class _ThemeHook extends Hook<ThemeData> {
  @override
  HookState<ThemeData, Hook<ThemeData>> createState() {
    return _ThemeHookState();
  }
}

class _ThemeHookState extends HookState<ThemeData, Hook<ThemeData>> {
  @override
  ThemeData build(BuildContext context) {
    return Theme.of(context);
  }
}
