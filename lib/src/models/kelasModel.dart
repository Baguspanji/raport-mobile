class KelasModel {
  bool status;
  List<Data> data;
  String message;

  KelasModel({this.status, this.data, this.message});

  KelasModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String idKelas;
  String namaKelas;
  String waliKelas;
  String tahunAjaran;
  String status;
  String sekolah;
  String createDate;
  String idTahun;
  String ganjilDari;
  String ganjilSampai;
  String genapDari;
  String genapSampai;

  Data(
      {this.idKelas,
      this.namaKelas,
      this.waliKelas,
      this.tahunAjaran,
      this.status,
      this.sekolah,
      this.createDate,
      this.idTahun,
      this.ganjilDari,
      this.ganjilSampai,
      this.genapDari,
      this.genapSampai});

  Data.fromJson(Map<String, dynamic> json) {
    idKelas = json['id_kelas'];
    namaKelas = json['nama_kelas'];
    waliKelas = json['wali_kelas'];
    tahunAjaran = json['tahun_ajaran'];
    status = json['status'];
    sekolah = json['sekolah'];
    createDate = json['create_date'];
    idTahun = json['id_tahun'];
    ganjilDari = json['ganjil_dari'];
    ganjilSampai = json['ganjil_sampai'];
    genapDari = json['genap_dari'];
    genapSampai = json['genap_sampai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_kelas'] = this.idKelas;
    data['nama_kelas'] = this.namaKelas;
    data['wali_kelas'] = this.waliKelas;
    data['tahun_ajaran'] = this.tahunAjaran;
    data['status'] = this.status;
    data['sekolah'] = this.sekolah;
    data['create_date'] = this.createDate;
    data['id_tahun'] = this.idTahun;
    data['ganjil_dari'] = this.ganjilDari;
    data['ganjil_sampai'] = this.ganjilSampai;
    data['genap_dari'] = this.genapDari;
    data['genap_sampai'] = this.genapSampai;
    return data;
  }
}
