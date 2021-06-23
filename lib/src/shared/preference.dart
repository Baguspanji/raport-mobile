import 'package:shared_preferences/shared_preferences.dart';

Future setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("token", value);
}

Future getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("token");
}

Future rmvToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("token");
}

Future setIdUser(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("Iduser", value);
}

Future getIdUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("Iduser");
}

Future rmvIdUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("Iduser");
}

Future setNama(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("nama", value);
}

Future getNama() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("nama");
}

Future rmvNama() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("nama");
}

Future setUsername(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("username", value);
}

Future getUsername() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("username");
}

Future rmvUsername() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("username");
}

Future setAlamat(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("alamat", value);
}

Future getAlamat() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("alamat");
}

Future rmvAlamat() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("alamat");
}

Future setTtl(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("ttl", value);
}

Future getTtl() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("ttl");
}

Future rmvTtl() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("ttl");
}

Future setImg(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("img", value);
}

Future getImg() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("img");
}

Future rmvImg() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("img");
}
