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
    this.image,
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
  String? image;

  factory UserM.fromJson(Map<String, dynamic> json) => UserM(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        handphone: json["handphone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "email": email,
        "handphone": handphone,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "role": role,
        "image": image,
      };
}
