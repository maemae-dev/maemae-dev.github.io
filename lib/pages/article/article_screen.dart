import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/state/aritcles.dart';

class ArticleScreen extends HookWidget {
  const ArticleScreen(this.path, {Key? key}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: useProvider(articles).when(
        data: (data) {
          final article = data.firstWhere((element) => element.path == path);
          return Markdown(data: article.data!);
        },
        loading: () => const Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        ),
        error: (_, __) => Container(),
      ),
    );
  }
}
