import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/entities/article.dart';
import 'package:portfolio/hooks/use_theme.dart';

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
