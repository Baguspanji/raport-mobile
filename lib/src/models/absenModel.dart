// To parse this JSON data, do
//
//     final absenModel = absenModelFromJson(jsonString);

import 'dart:convert';

class AbsenModel {
  AbsenModel({
    this.status,
    this.data,
    this.message,
  });

  bool status;
  Data data;
  String message;

  factory AbsenModel.fromRawJson(String str) =>
      AbsenModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AbsenModel.fromJson(Map<String, dynamic> json) => AbsenModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.alpha,
    this.izin,
    this.sakit,
  });

  int alpha;
  int izin;
  int sakit;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        alpha: json["alpha"],
        izin: json["izin"],
        sakit: json["sakit"],
      );

  Map<String, dynamic> toJson() => {
        "alpha": alpha,
        "izin": izin,
        "sakit": sakit,
      };
}
