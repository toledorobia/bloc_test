import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/auth_guard.dart';
import 'package:bloc_test/pages/login_page.dart';
import 'package:bloc_test/pages/main_page.dart';
import 'package:bloc_test/pages/post_page.dart';
import 'package:bloc_test/pages/posts_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(page: PostsPage, guards: [AuthGuard]),
    AutoRoute(page: PostPage, guards: [AuthGuard]),
    AutoRoute(page: LoginPage),
  ],
)
class $AppRouter {}
