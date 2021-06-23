class SyaratModel {
  bool status;
  List<Data> data;
  String message;

  SyaratModel({this.status, this.data, this.message});

  SyaratModel.fromJson(Map<String, dynamic> json) {
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
  String idSyarat;
  String ketentuan;
  String createDate;

  Data({this.idSyarat, this.ketentuan, this.createDate});

  Data.fromJson(Map<String, dynamic> json) {
    idSyarat = json['id_syarat'];
    ketentuan = json['ketentuan'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_syarat'] = this.idSyarat;
    data['ketentuan'] = this.ketentuan;
    data['create_date'] = this.createDate;
    return data;
  }
}
