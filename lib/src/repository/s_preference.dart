import 'package:shared_preferences/shared_preferences.dart';

Future setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("Token", value);
}

Future getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("Token");
}

Future rmvToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("Token");
}

Future setUsername(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("Username", value);
}

Future getUsername() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("Username");
}

Future rmvUsername() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("Username");
}
