import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/theme_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const FaIcon(FontAwesomeIcons.twitter),
                  title: const Text('Twitter'),
                  onTap: () {
                    launch('https://twitter.com/maemae_dev');
                  },
                ),
                ListTile(
                  leading: const FaIcon(FontAwesomeIcons.github),
                  title: const Text('Github'),
                  onTap: () {
                    launch('https://github.com/maemae-dev');
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: const Text('Switch Theme'),
              trailing: ThemeSwitch(),
            ),
          ),
        ],
      ),
    );
  }
}
