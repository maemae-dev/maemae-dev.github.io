import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/article_screen.dart';
import 'package:portfolio/pages/home.dart';

final router = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const Home()),
        routes: [
          GoRoute(
            path: 'articles/:aid',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: ArticleScreen(state.params['aid']!),
            ),
          )
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        appBar: AppBar(title: const Text('404')),
      ),
    ),
  ),
);
