import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/gen/assets.gen.dart';

final articlesProvider = FutureProvider(fetchArticles);

Future<List<Article>> fetchArticles(ProviderReference ref) async {
  final json = await rootBundle.loadString(Assets.articlesJson);
  final articlesJson = jsonDecode(json) as List<dynamic>;
  final futures = (articlesJson.cast<Map<String, dynamic>>()).map(
    (article) async {
      return Article(
          title: article["title"] as String? ?? '',
          path: article['path'] as String? ?? '',
          data: await rootBundle
              .loadString('assets/articles/${article['path'] as String}.md'));
    },
  ).toList();
  return Future.wait(futures);
}

class Article {
  Article({required this.title, required this.path, this.data});
  final String title;
  final String path;
  final String? data;
}
