import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_test/models/post_model.dart';

class PostsRepository {
  Future<List<PostModel>> fetchAll() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);
    final data = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    return data.map((it) => PostModel.fromJson(it)).toList();
  }

  Future<PostModel> fetchById(int id) async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
    final response = await http.get(url);
    final data =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    return PostModel.fromJson(data);
  }
}
