class UserDetailModel {
  String? nis;
  String? nisn;
  String? nama;
  String? alamat;
  String? tempatLahir;
  String? tanggalLahir;
  String? jenisKelamin;
  String? agama;
  String? statusKeluarga;
  String? anakKe;
  String? telepon;
  String? sekolahAsal;
  String? diterimaKelas;
  String? diterimaTanggal;
  String? namaAyah;
  String? namaIbu;
  String? alamatOrangtua;
  String? kerjaAyah;
  String? kerjaIbu;
  String? namaWali;
  String? alamatWali;
  String? kerjaWali;

  UserDetailModel(
      {this.nis,
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
      this.kerjaWali});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    nis = json['nis'];
    nisn = json['nisn'];
    nama = json['nama'];
    alamat = json['alamat'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    agama = json['agama'];
    statusKeluarga = json['status_keluarga'];
    anakKe = json['anak_ke'];
    telepon = json['telepon'];
    sekolahAsal = json['sekolah_asal'];
    diterimaKelas = json['diterima_kelas'];
    diterimaTanggal = json['diterima_tanggal'];
    namaAyah = json['nama_ayah'];
    namaIbu = json['nama_ibu'];
    alamatOrangtua = json['alamat_orangtua'];
    kerjaAyah = json['kerja_ayah'];
    kerjaIbu = json['kerja_ibu'];
    namaWali = json['nama_wali'];
    alamatWali = json['alamat_wali'];
    kerjaWali = json['kerja_wali'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nis'] = this.nis;
    data['nisn'] = this.nisn;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['agama'] = this.agama;
    data['status_keluarga'] = this.statusKeluarga;
    data['anak_ke'] = this.anakKe;
    data['telepon'] = this.telepon;
    data['sekolah_asal'] = this.sekolahAsal;
    data['diterima_kelas'] = this.diterimaKelas;
    data['diterima_tanggal'] = this.diterimaTanggal;
    data['nama_ayah'] = this.namaAyah;
    data['nama_ibu'] = this.namaIbu;
    data['alamat_orangtua'] = this.alamatOrangtua;
    data['kerja_ayah'] = this.kerjaAyah;
    data['kerja_ibu'] = this.kerjaIbu;
    data['nama_wali'] = this.namaWali;
    data['alamat_wali'] = this.alamatWali;
    data['kerja_wali'] = this.kerjaWali;
    return data;
  }
}
