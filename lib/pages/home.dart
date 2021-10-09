import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/layout.dart';
import 'package:portfolio/providers/aritcles_provider.dart';
import 'package:portfolio/theme_switch.dart';
import 'package:portfolio/util/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends HookWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return Layout(defaultLayout: NarrowLayout(), medium: WideLayout());
  }
}

class WideLayout extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 300,
            child: HomeDrawerList(),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          Expanded(child: Profile())
        ],
      ),
    );
  }
}

class NarrowLayout extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: HomeDrawerList()),
      body: Profile(),
    );
  }
}

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

class Profile extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = useTheme();
    final articles = useProvider(articlesProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('Kazuma Maekawa', style: theme.textTheme.headline4),
          ),
          Row(
            children: [
              Flexible(
                child: SizedBox(
                  width: 500,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Assets.images.me.image(fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('Skill', style: theme.textTheme.headline5),
          ),
          Text(
            'Flutter / React / Firebase / Ruby on Rails',
            style: theme.textTheme.bodyText1,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('Articles', style: theme.textTheme.headline6),
          ),
          articles.when(
              data: (articles) => Column(
                    children: articles.map((a) => ArticleCard(a)).toList(),
                  ),
              loading: () => const CircularProgressIndicator(),
              error: (_, __) => Container()),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '2021 \u00a9 Kazuma Maekawa.',
                style: theme.textTheme.caption,
              )
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class ArticleCard extends HookWidget {
  const ArticleCard(this.article);
  final Article article;

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Row(
      children: [
        Flexible(
          child: SizedBox(
            width: 500,
            child: Card(
              child: InkWell(
                onTap: () {
                  context.go('/articles/${article.path}');
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            article.title,
                            style: theme.textTheme.headline5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
