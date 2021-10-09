import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/layouts/layout.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({Key? key, required this.main, required this.drawer})
      : super(key: key);

  final Widget drawer;
  final Widget main;

  @override
  Widget build(BuildContext context) {
    return Layout(
      defaultLayout: NarrowLayout(
        main: main,
        drawer: drawer,
      ),
      medium: WideLayout(
        main: main,
        drawer: drawer,
      ),
    );
  }
}

class WideLayout extends HookWidget {
  const WideLayout({required this.main, required this.drawer});

  final Widget drawer;
  final Widget main;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 300,
            child: drawer,
          ),
          const VerticalDivider(width: 1, thickness: 1),
          Expanded(child: main)
        ],
      ),
    );
  }
}

class NarrowLayout extends HookWidget {
  const NarrowLayout({required this.main, required this.drawer});

  final Widget drawer;
  final Widget main;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: drawer),
      body: main,
    );
  }
}
