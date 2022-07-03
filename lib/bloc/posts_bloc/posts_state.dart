part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  final List<PostModel> posts;

  const LoadedPostsState(this.posts);

  @override
  List<Object?> get props => [posts];
}

class ErrorPostsState extends PostsState {
  final String error;

  const ErrorPostsState(this.error);

  @override
  List<Object?> get props => [error];
}
