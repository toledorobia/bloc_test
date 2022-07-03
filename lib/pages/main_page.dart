import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_test/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_test/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoggedAuthState) {
          context.router.replace(const PostsRoute());
        } else if (state is NotLoggedAuthState) {
          context.router.replace(const LoginRoute());
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'lib/assets/flutter_logo.png',
                width: 100,
                isAntiAlias: true,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(
                height: 30,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
