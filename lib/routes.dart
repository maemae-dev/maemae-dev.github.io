import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/article_screen.dart';
import 'package:portfolio/pages/home.dart';

final parser = Provider((ref) => MyRouteInformationParser());
final routerDelegate = Provider((ref) => MyRouteDelegate());

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');

    if (uri.pathSegments.isEmpty) {
      return MyRoutePath.home();
    }
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'articles') {
        return MyRoutePath.article(uri.pathSegments[1]);
      }
    }
    return MyRoutePath.home();
  }

  @override
  RouteInformation? restoreRouteInformation(MyRoutePath configuration) {
    if (configuration.routes == Routes.home) {
      return const RouteInformation(location: '/');
    }
    if (configuration.routes == Routes.articles) {
      return RouteInformation(location: '/articles/${configuration.articleId}');
    }
    return null;
  }
}

class MyRouteDelegate extends ValueRouterDelegate<RouteState, MyRoutePath> {
  MyRouteDelegate()
      : navigatorKey = GlobalKey<NavigatorState>(),
        super(RouteState.home());
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  // TODO: implement currentConfiguration
  MyRoutePath? get currentConfiguration {
    if (value.routes == Routes.home) return MyRoutePath.home();
    if (value.routes == Routes.articles) {
      return MyRoutePath.article(value.articleId);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(
          child: Home(),
        ),
        if (value.routes == Routes.articles)
          MaterialPage(
            child: ArticleScreen(value.articleId!),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        value = RouteState.home();
        return true;
      },
    );
  }

  @override
  Future<bool> popRoute() async {
    return true;
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    value = RouteState(configuration.routes, configuration.articleId);
    // TODO: 404 page
  }

  void setArticleRoute(String id) {
    value = RouteState.article(id);
  }
}

class MyRoutePath {
  MyRoutePath.home() : routes = Routes.home;
  MyRoutePath.article(this.articleId) : routes = Routes.articles;

  Routes routes;
  String? articleId;
}

enum Routes {
  home,
  articles,
}

class RouteState {
  RouteState(this.routes, this.articleId);
  RouteState.home()
      : routes = Routes.home,
        articleId = null;
  RouteState.article(this.articleId) : routes = Routes.articles;

  Routes routes;
  String? articleId;
}

abstract class ValueRouterDelegate<V, T> extends ValueNotifier<V>
    implements RouterDelegate<T> {
  ValueRouterDelegate(V value) : super(value);
  @override
  T? get currentConfiguration => null;
  @override
  Future<void> setInitialRoutePath(T configuration) {
    return setNewRoutePath(configuration);
  }
}
