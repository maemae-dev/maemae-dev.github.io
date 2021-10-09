import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/repositories/article_repository.dart';

final articles =
    FutureProvider((ref) => ref.watch(articleRepository).fetchArticles());
