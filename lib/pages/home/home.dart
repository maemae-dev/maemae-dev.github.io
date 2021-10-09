import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/layouts/drawer_layout.dart';
import 'package:portfolio/pages/home/home_drawer_list.dart';
import 'package:portfolio/pages/home/profile.dart';

class Home extends HookWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return DrawerLayout(main: Profile(), drawer: HomeDrawerList());
  }
}
