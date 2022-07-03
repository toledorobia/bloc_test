import 'package:bloc/bloc.dart';
import 'package:bloc_test/models/post_model.dart';
import 'package:bloc_test/resources/posts_repository.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;

  PostsBloc({required this.postsRepository}) : super(LoadingPostsState()) {
    on<GetPostsEvent>((event, emit) async {
      emit(LoadingPostsState());

      try {
        // print("Request posts");
        final posts = await postsRepository.fetchAll();
        emit(LoadedPostsState(posts));
      } catch (e) {
        emit(ErrorPostsState(e.toString()));
      }
    });
  }
}
