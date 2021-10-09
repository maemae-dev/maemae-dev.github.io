import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/hooks/use_breakpoint.dart';

class Layout extends HookWidget {
  const Layout({
    required this.defaultLayout,
    Widget? small,
    Widget? medium,
    Widget? large,
    Widget? xlarge,
  })  : handsetFirst = true,
        _layout1 = xlarge,
        _layout2 = large,
        _layout3 = medium,
        _layout4 = small;

  const Layout.desktopFirst({
    required this.defaultLayout,
    Widget? large,
    Widget? medium,
    Widget? small,
    Widget? xsmall,
  })  : handsetFirst = false,
        _layout1 = large,
        _layout2 = medium,
        _layout3 = small,
        _layout4 = xsmall;

  final Widget defaultLayout;
  final Widget? _layout1;
  final Widget? _layout2;
  final Widget? _layout3;
  final Widget? _layout4;

  final bool handsetFirst;

  @override
  Widget build(BuildContext context) {
    final breakpoint = useBreakpoint();

    if (handsetFirst) {
      if (breakpoint.window >= WindowSize.xlarge && _layout1 != null) {
        return _layout1!;
      }
      if (breakpoint.window >= WindowSize.large && _layout2 != null) {
        return _layout2!;
      }
      if (breakpoint.window >= WindowSize.medium && _layout3 != null) {
        return _layout3!;
      }
      if (breakpoint.window >= WindowSize.small && _layout4 != null) {
        return _layout4!;
      }
      return defaultLayout;
    } else {
      if (breakpoint.window <= WindowSize.xsmall && _layout4 != null) {
        return _layout4!;
      }
      if (breakpoint.window <= WindowSize.small && _layout3 != null) {
        return _layout3!;
      }
      if (breakpoint.window <= WindowSize.medium && _layout2 != null) {
        return _layout2!;
      }
      if (breakpoint.window <= WindowSize.large && _layout1 != null) {
        return _layout1!;
      }
      return defaultLayout;
    }
  }
}
