import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_test/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_test/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts List"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutAuthEvent());
              context.router.replaceAll([const LoginRoute()]);
            },
          ),
        ],
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ErrorPostsState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }

          if (state is LoadedPostsState) {
            return ListView.separated(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];

                return ListTile(
                  title: Text(post.title),
                  onTap: () {
                    context.router.push(PostRoute(id: post.id));
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade600,
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
