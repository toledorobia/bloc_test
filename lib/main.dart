import 'package:bloc_test/auth_guard.dart';
import 'package:bloc_test/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_test/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_test/locator.dart';
import 'package:bloc_test/resources/posts_repository.dart';
import 'package:bloc_test/resources/storage_service.dart';
import 'package:bloc_test/resources/users_repository.dart';
import 'package:bloc_test/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter(authGuard: AuthGuard());

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<StorageService>(
          create: (context) => StorageService(),
        ),
        RepositoryProvider<UsersRepository>(
          create: ((context) => UsersRepository()),
        ),
        RepositoryProvider<PostsRepository>(
          create: (context) => PostsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              storageService: context.read<StorageService>(),
              usersRepository: context.read<UsersRepository>(),
            )..add(CheckAuthEvent()),
            // ),
          ),
          BlocProvider<PostsBloc>(
            create: (context) => PostsBloc(
              postsRepository: context.read<PostsRepository>(),
            ),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is LoggedAuthState) {
                  final user = context.read<AuthBloc>().state.user;

                  context
                      .read<PostsBloc>()
                      .add(GetPostsEvent(userId: user!.id));
                } else if (state is NotLoggedAuthState) {}
              },
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Bloc Test",
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
          ),
        ),
      ),
    );
  }
}
