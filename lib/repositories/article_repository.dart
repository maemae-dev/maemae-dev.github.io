import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/entities/article.dart';
import 'package:portfolio/gen/assets.gen.dart';

final articleRepository = Provider((ref) => ArticleRepository());

class ArticleRepository {
  Future<List<Article>> fetchArticles() async {
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
}
