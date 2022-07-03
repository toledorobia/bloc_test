class UserModel {
  final int id;
  final String name;
  final String email;
  final String username;
  final String password;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      username: json["username"],
      password: "qwerty",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
