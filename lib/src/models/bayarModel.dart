// To parse this JSON data, do
//
//     final bayarModel = bayarModelFromJson(jsonString);

import 'dart:convert';

class BayarModel {
  BayarModel({
    this.status,
    this.data,
    this.message,
  });

  bool status;
  List<Datum> data;
  String message;

  factory BayarModel.fromRawJson(String str) =>
      BayarModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BayarModel.fromJson(Map<String, dynamic> json) => BayarModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.bayar,
    this.status,
    this.tanggal,
  });

  String bayar;
  int status;
  DateTime tanggal;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bayar: json["bayar"],
        status: json["status"],
        tanggal: DateTime.parse(json["tanggal"]),
      );

  Map<String, dynamic> toJson() => {
        "bayar": bayar,
        "status": status,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
      };
}
