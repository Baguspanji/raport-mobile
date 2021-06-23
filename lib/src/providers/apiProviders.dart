import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:raport/src/models/absenModel.dart';
import 'package:raport/src/models/bayarModel.dart';
import 'package:raport/src/models/detailModel.dart';
import 'package:raport/src/models/kelasModel.dart';
import 'package:raport/src/models/loginModel.dart';
import 'package:raport/src/models/nilaiModel.dart';
import 'package:raport/src/models/resData.dart';
import 'package:raport/src/models/syaratModel.dart';

class ApiProviders {
  String url = "https://sekolah.aktivisjalanan.com/restapi";

  Future login(String user, String pass, String token) async {
    Uri uri = Uri.parse("$url/siswa/login");
    var body = jsonEncode({'username': user, 'password': pass, 'token': token});
    try {
      final res = await http
          .post(uri, headers: {"Content-Type": "application/json"}, body: body)
          .timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        return LoginModel.fromJson(json.decode(res.body));
      } else if (res.statusCode == 404) {
        return LoginModel.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getPassword(String user, String pass, String token) async {
    Uri uri = Uri.parse("$url/siswa/ubah_pass");
    var body = jsonEncode({'username': user, 'password': pass});
    try {
      final res = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        return ResData.fromJson(json.decode(res.body));
      } else if (res.statusCode == 404) {
        return ResData.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getDetail(String user, String token) async {
    Uri uri = Uri.parse("$url/siswa/detail");
    var body = jsonEncode({'username': user});
    try {
      final res = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        return DetailModel.fromJson(json.decode(res.body));
      } else if (res.statusCode == 404) {
        return DetailModel.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getKelas(String user, String token) async {
    Uri uri = Uri.parse("$url/siswa/semester");
    var body = jsonEncode({'username': user, 'token': token});
    try {
      final res = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        return KelasModel.fromJson(json.decode(res.body));
      } else if (res.statusCode == 404) {
        return KelasModel.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getAbsen(String user, String token, String awal, String akhir) async {
    Uri uri = Uri.parse("$url/siswa/absen");
    var body = jsonEncode({
      'username': user,
      'tgl_awal': awal,
      'tgl_akhir': akhir,
    });
    try {
      final res = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        return AbsenModel.fromJson(json.decode(res.body));
      } else if (res.statusCode == 404) {
        return AbsenModel.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getBayar(
    String user,
    String token,
    String awal,
    String akhir,
    int kelas,
    int semester,
  ) async {
    Uri uri = Uri.parse("$url/siswa/bayar");
    var body = jsonEncode({
      'username': user,
      'tgl_awal': awal,
      'tgl_akhir': akhir,
      'id_kelas': kelas,
      'semester': semester,
    });
    try {
      final res = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        return BayarModel.fromJson(json.decode(res.body));
      } else if (res.statusCode == 404) {
        return BayarModel.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getNilai(
    String user,
    String token,
    String awal,
    String akhir,
    int kelas,
  ) async {
    Uri uri = Uri.parse("$url/siswa/nilai");
    var body = jsonEncode({
      'username': user,
      'tgl_awal': awal,
      'tgl_akhir': akhir,
      'id_kelas': kelas,
    });
    try {
      final res = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                "Authorization": token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        // print(res.body);
        return NilaiModel.fromJson(json.decode(res.body));
      } else if (res.statusCode == 404) {
        return NilaiModel.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getSyarat() async {
    Uri uri = Uri.parse("$url/siswa/syarat");
    try {
      final res = await http.get(uri).timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        // print(res.body);
        return SyaratModel.fromJson(json.decode(res.body));
      } else if (res.statusCode == 404) {
        return SyaratModel.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }
}
