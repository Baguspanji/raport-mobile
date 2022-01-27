import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/connect.dart';
import 'package:raport/src/configs/constans_config.dart';
import 'package:raport/src/repository/s_preference.dart';

class Api extends GetConnect {
  final String url = '$globalApi/restapi';

  // ============ Auth
  Future<Response> authentication(String user, String pass,
      {String token = ''}) async {
    dynamic headers = {'Content-Type': 'application/json'};
    dynamic data = {'username': user, 'password': pass, 'token': token};

    var res =
        await post('$url/siswa/login', jsonEncode(data), headers: headers);

    return getRes(res);
  }

  Future<Response> getUser() async {
    String token = await getToken();
    String username = await getUsername();
    dynamic headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    dynamic data = {'username': username};

    var res =
        await post('$url/siswa/detail', jsonEncode(data), headers: headers);

    return getRes(res);
  }
}

// ==========================================

Future<Response> getRes(Response res) async {
  try {
    return res;
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
