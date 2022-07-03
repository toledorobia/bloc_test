// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import 'auth_guard.dart' as _i7;
import 'pages/login_page.dart' as _i4;
import 'pages/main_page.dart' as _i1;
import 'pages/post_page.dart' as _i3;
import 'pages/posts_page.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    PostsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PostsPage());
    },
    PostRoute.name: (routeData) {
      final args = routeData.argsAs<PostRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.PostPage(key: args.key, id: args.id));
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(MainRoute.name, path: '/'),
        _i5.RouteConfig(PostsRoute.name,
            path: '/posts-page', guards: [authGuard]),
        _i5.RouteConfig(PostRoute.name,
            path: '/post-page', guards: [authGuard]),
        _i5.RouteConfig(LoginRoute.name, path: '/login-page')
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.PostsPage]
class PostsRoute extends _i5.PageRouteInfo<void> {
  const PostsRoute() : super(PostsRoute.name, path: '/posts-page');

  static const String name = 'PostsRoute';
}

/// generated route for
/// [_i3.PostPage]
class PostRoute extends _i5.PageRouteInfo<PostRouteArgs> {
  PostRoute({_i6.Key? key, required int id})
      : super(PostRoute.name,
            path: '/post-page', args: PostRouteArgs(key: key, id: id));

  static const String name = 'PostRoute';
}

class PostRouteArgs {
  const PostRouteArgs({this.key, required this.id});

  final _i6.Key? key;

  final int id;

  @override
  String toString() {
    return 'PostRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}
