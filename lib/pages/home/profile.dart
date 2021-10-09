import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/hooks/use_theme.dart';
import 'package:portfolio/components/article_card.dart';
import 'package:portfolio/state/aritcles_provider.dart';

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
              loading: () => const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
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
