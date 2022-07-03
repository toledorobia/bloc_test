import 'package:bloc_test/resources/posts_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<PostsRepository>(PostsRepository());
}
