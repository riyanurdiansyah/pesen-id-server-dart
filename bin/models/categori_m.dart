import 'dart:convert';

List<CategoriM> categoriMFromJson(String str) =>
    List<CategoriM>.from(json.decode(str).map((x) => CategoriM.fromJson(x)));

String categoriMToJson(List<CategoriM> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriM {
  CategoriM({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CategoriM.fromJson(Map<String, dynamic> json) => CategoriM(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
