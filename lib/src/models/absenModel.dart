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
    this.masuk,
    this.alpha,
    this.izin,
    this.sakit,
  });

  Alpha masuk;
  Alpha alpha;
  Alpha izin;
  Alpha sakit;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        masuk: Alpha.fromJson(json["masuk"]),
        alpha: Alpha.fromJson(json["alpha"]),
        izin: Alpha.fromJson(json["izin"]),
        sakit: Alpha.fromJson(json["sakit"]),
      );

  Map<String, dynamic> toJson() => {
        "masuk": masuk.toJson(),
        "alpha": alpha.toJson(),
        "izin": izin.toJson(),
        "sakit": sakit.toJson(),
      };
}

class Alpha {
  Alpha({
    this.count,
    this.detail,
  });

  int count;
  List<Detail> detail;

  factory Alpha.fromRawJson(String str) => Alpha.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Alpha.fromJson(Map<String, dynamic> json) => Alpha(
        count: json["count"],
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.tanggal,
  });

  DateTime tanggal;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        tanggal: DateTime.parse(json["tanggal"]),
      );

  Map<String, dynamic> toJson() => {
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
      };
}
