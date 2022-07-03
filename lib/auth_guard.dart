import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_test/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    AuthBloc? bloc = router.navigatorKey.currentContext?.read<AuthBloc>();

    if (bloc?.state is LoggedAuthState) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
