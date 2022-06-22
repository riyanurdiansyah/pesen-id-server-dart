import 'dart:convert';

List<UserM> userMFromJson(String str) =>
    List<UserM>.from(json.decode(str).map((x) => UserM.fromJson(x)));

String userMToJson(List<UserM> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserM {
  UserM({
    this.id,
    this.username,
    this.name,
    this.email,
    this.handphone,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.password,
  });

  int? id;
  String? username;
  String? name;
  String? email;
  String? handphone;
  String? password;
  int? role;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserM.fromJson(Map<String, dynamic> json) => UserM(
        name: json["name"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        handphone: json["handphone"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "email": email,
        "handphone": handphone,
        "role": role,
      };
}
