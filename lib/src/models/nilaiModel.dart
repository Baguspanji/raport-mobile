// To parse this JSON data, do
//
//     final nilaiModel = nilaiModelFromJson(jsonString);

import 'dart:convert';

class NilaiModel {
  NilaiModel({
    this.status,
    this.data,
    this.message,
  });

  bool status;
  List<Datum> data;
  String message;

  factory NilaiModel.fromRawJson(String str) =>
      NilaiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NilaiModel.fromJson(Map<String, dynamic> json) => NilaiModel(
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
    this.pelajaran,
    this.nilaiMinim,
    this.jenis,
  });

  String pelajaran;
  String nilaiMinim;
  List<Jeni> jenis;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        pelajaran: json["pelajaran"],
        nilaiMinim: json["nilai_minim"],
        jenis: List<Jeni>.from(json["jenis"].map((x) => Jeni.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pelajaran": pelajaran,
        "nilai_minim": nilaiMinim,
        "jenis": List<dynamic>.from(jenis.map((x) => x.toJson())),
      };
}

class Jeni {
  Jeni({
    this.jenis,
    this.nilaiRata,
    this.nilai,
  });

  String jenis;
  double nilaiRata;
  List<Nilai> nilai;

  factory Jeni.fromRawJson(String str) => Jeni.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Jeni.fromJson(Map<String, dynamic> json) => Jeni(
        jenis: json["jenis"],
        nilaiRata: json["nilai_rata"].toDouble(),
        nilai: List<Nilai>.from(json["nilai"].map((x) => Nilai.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jenis": jenis,
        "nilai_rata": nilaiRata,
        "nilai": List<dynamic>.from(nilai.map((x) => x.toJson())),
      };
}

class Nilai {
  Nilai({
    this.nilai,
  });

  String nilai;

  factory Nilai.fromRawJson(String str) => Nilai.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Nilai.fromJson(Map<String, dynamic> json) => Nilai(
        nilai: json["nilai"],
      );

  Map<String, dynamic> toJson() => {
        "nilai": nilai,
      };
}
