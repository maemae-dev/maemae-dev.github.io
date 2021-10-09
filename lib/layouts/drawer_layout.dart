import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/layouts/layout.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout(
      {Key? key, required this.main, required this.drawer, this.appBar})
      : super(key: key);

  final Widget drawer;
  final Widget main;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Layout(
      defaultLayout: NarrowLayout(
        main: main,
        drawer: drawer,
        appBar: appBar,
      ),
      medium: WideLayout(
        main: main,
        drawer: drawer,
        appBar: appBar,
      ),
    );
  }
}

class WideLayout extends HookWidget {
  const WideLayout({required this.main, required this.drawer, this.appBar});

  final Widget drawer;
  final Widget main;
  final AppBar? appBar;

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
          Expanded(
            child: Scaffold(
              appBar: appBar,
              body: main,
            ),
          )
        ],
      ),
    );
  }
}

class NarrowLayout extends HookWidget {
  const NarrowLayout({required this.main, required this.drawer, this.appBar});

  final Widget drawer;
  final Widget main;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? AppBar(),
      drawer: Drawer(child: drawer),
      body: main,
    );
  }
}
