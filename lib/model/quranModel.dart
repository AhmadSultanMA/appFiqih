// To parse this JSON data, do
//
//     final detailQuranModel = detailQuranModelFromJson(jsonString);

part of 'models.dart';

List<DetailQuranModel> detailQuranModelFromJson(String str) =>
    List<DetailQuranModel>.from(
        json.decode(str).map((x) => DetailQuranModel.fromJson(x)));

String detailQuranModelToJson(List<DetailQuranModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailQuranModel {
  DetailQuranModel({
    this.ar,
    this.id,
    this.nomor,
    this.tr,
  });

  String ar;
  String id;
  String nomor;
  String tr;

  factory DetailQuranModel.fromJson(Map<String, dynamic> json) =>
      DetailQuranModel(
        ar: json["ar"],
        id: json["id"],
        nomor: json["nomor"],
        tr: json["tr"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "id": id,
        "nomor": nomor,
        "tr": tr,
      };
}
