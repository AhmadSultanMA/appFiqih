// To parse this JSON data, do
//
//     final fiqihModel = fiqihModelFromJson(jsonString);

part of 'models.dart';

List<FiqihModel> fiqihModelFromJson(String str) =>
    List<FiqihModel>.from(json.decode(str).map((x) => FiqihModel.fromJson(x)));

String fiqihModelToJson(List<FiqihModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FiqihModel {
  FiqihModel({
    this.id,
    this.hukum,
    this.dalil,
    this.tDalil,
    this.penjelasan,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String hukum;
  String dalil;
  String tDalil;
  String penjelasan;
  DateTime createdAt;
  DateTime updatedAt;

  factory FiqihModel.fromJson(Map<String, dynamic> json) => FiqihModel(
        id: json["id"],
        hukum: json["hukum"],
        dalil: json["dalil"],
        tDalil: json["t_dalil"],
        penjelasan: json["penjelasan"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hukum": hukum,
        "dalil": dalil,
        "t_dalil": tDalil,
        "penjelasan": penjelasan,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
