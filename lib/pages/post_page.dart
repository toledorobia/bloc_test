import 'package:bloc_test/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_test/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  final int id;

  const PostPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post List"),
      ),
      body: BlocSelector<PostsBloc, PostsState, PostModel?>(
        selector: (state) {
          if (state is LoadedPostsState) {
            return state.posts.firstWhere((it) => it.id == id);
          }

          return null;
        },
        builder: (context, post) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post!.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      post.body,
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
