class AuthModel {
  String? jwtToken;
  String? username;
  String? nama;
  String? alamat;
  String? tempatLahir;
  String? tanggalLahir;
  String? image;

  AuthModel(
      {this.jwtToken,
      this.username,
      this.nama,
      this.alamat,
      this.tempatLahir,
      this.tanggalLahir,
      this.image});

  AuthModel.fromJson(Map<String, dynamic> json) {
    jwtToken = json['jwt_token'];
    username = json['username'];
    nama = json['nama'];
    alamat = json['alamat'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt_token'] = this.jwtToken;
    data['username'] = this.username;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['image'] = this.image;
    return data;
  }
}
