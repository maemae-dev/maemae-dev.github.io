import 'package:breakpoint/breakpoint.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Breakpoint useBreakpoint() {
  return use(_BreakpointHook());
}

class _BreakpointHook extends Hook<Breakpoint> {
  @override
  HookState<Breakpoint, Hook<Breakpoint>> createState() {
    return _BreakpointHookState();
  }
}

class _BreakpointHookState extends HookState<Breakpoint, Hook<Breakpoint>> {
  @override
  Breakpoint build(BuildContext context) {
    return Breakpoint.fromMediaQuery(context);
  }
}
