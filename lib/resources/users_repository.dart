import 'dart:convert';
import 'package:bloc_test/models/user_model.dart';
import 'package:http/http.dart' as http;

class UsersRepository {
  Future<List<UserModel>> fetchAll() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final response = await http.get(url);
    final data = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    return data.map((it) => UserModel.fromJson(it)).toList();
  }

  Future<UserModel> fetchByUsername(String username) async {
    final url = Uri.parse(
        "https://jsonplaceholder.typicode.com/users?username=$username");
    final response = await http.get(url);
    final data = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    final users = data.map((it) => UserModel.fromJson(it)).toList();

    return users.first;
  }
}
