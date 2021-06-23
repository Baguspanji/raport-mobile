// To parse this JSON data, do
//
//     final detailModel = detailModelFromJson(jsonString);

import 'dart:convert';

class DetailModel {
  DetailModel({
    this.status,
    this.data,
    this.message,
  });

  bool status;
  Data data;
  String message;

  factory DetailModel.fromRawJson(String str) =>
      DetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
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
    this.nis,
    this.nisn,
    this.nama,
    this.alamat,
    this.tempatLahir,
    this.tanggalLahir,
    this.jenisKelamin,
    this.agama,
    this.statusKeluarga,
    this.anakKe,
    this.telepon,
    this.sekolahAsal,
    this.diterimaKelas,
    this.diterimaTanggal,
    this.namaAyah,
    this.namaIbu,
    this.alamatOrangtua,
    this.kerjaAyah,
    this.kerjaIbu,
    this.namaWali,
    this.alamatWali,
    this.kerjaWali,
  });

  String nis;
  String nisn;
  String nama;
  String alamat;
  String tempatLahir;
  DateTime tanggalLahir;
  String jenisKelamin;
  String agama;
  String statusKeluarga;
  String anakKe;
  String telepon;
  String sekolahAsal;
  String diterimaKelas;
  DateTime diterimaTanggal;
  String namaAyah;
  String namaIbu;
  String alamatOrangtua;
  String kerjaAyah;
  String kerjaIbu;
  String namaWali;
  String alamatWali;
  String kerjaWali;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nis: json["nis"],
        nisn: json["nisn"],
        nama: json["nama"],
        alamat: json["alamat"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        agama: json["agama"],
        statusKeluarga: json["status_keluarga"],
        anakKe: json["anak_ke"],
        telepon: json["telepon"],
        sekolahAsal: json["sekolah_asal"],
        diterimaKelas: json["diterima_kelas"],
        diterimaTanggal: DateTime.parse(json["diterima_tanggal"]),
        namaAyah: json["nama_ayah"],
        namaIbu: json["nama_ibu"],
        alamatOrangtua: json["alamat_orangtua"],
        kerjaAyah: json["kerja_ayah"],
        kerjaIbu: json["kerja_ibu"],
        namaWali: json["nama_wali"],
        alamatWali: json["alamat_wali"],
        kerjaWali: json["kerja_wali"],
      );

  Map<String, dynamic> toJson() => {
        "nis": nis,
        "nisn": nisn,
        "nama": nama,
        "alamat": alamat,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "agama": agama,
        "status_keluarga": statusKeluarga,
        "anak_ke": anakKe,
        "telepon": telepon,
        "sekolah_asal": sekolahAsal,
        "diterima_kelas": diterimaKelas,
        "diterima_tanggal":
            "${diterimaTanggal.year.toString().padLeft(4, '0')}-${diterimaTanggal.month.toString().padLeft(2, '0')}-${diterimaTanggal.day.toString().padLeft(2, '0')}",
        "nama_ayah": namaAyah,
        "nama_ibu": namaIbu,
        "alamat_orangtua": alamatOrangtua,
        "kerja_ayah": kerjaAyah,
        "kerja_ibu": kerjaIbu,
        "nama_wali": namaWali,
        "alamat_wali": alamatWali,
        "kerja_wali": kerjaWali,
      };
}
