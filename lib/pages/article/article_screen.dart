import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/state/aritcles_provider.dart';

class ArticleScreen extends HookWidget {
  const ArticleScreen(this.path);
  final String path;

  @override
  Widget build(BuildContext context) {
    return useProvider(articlesProvider).when(
        data: (data) {
          final article = data.firstWhere((element) => element.path == path);
          return Scaffold(
            appBar: AppBar(),
            body: Markdown(data: article.data!),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (_, __) => const Scaffold());
  }
}
