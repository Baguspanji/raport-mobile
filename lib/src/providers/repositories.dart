import 'apiProviders.dart';

class Repositories {
  final apiProvider = ApiProviders();

  Future login(String username, String pass, String token) =>
      apiProvider.login(username, pass, token);

  Future getPassword(String username, String pass, String token) =>
      apiProvider.getPassword(username, pass, token);

  Future getKelas(String username, String token) =>
      apiProvider.getKelas(username, token);

  Future getDetail(String username, String token) =>
      apiProvider.getDetail(username, token);

  Future getAbsen(String username, String token, String awal, String akhir) =>
      apiProvider.getAbsen(username, token, awal, akhir);

  Future getBayar(String username, String token, String awal, String akhir,
          int kelas, int semester) =>
      apiProvider.getBayar(username, token, awal, akhir, kelas, semester);

  Future getNilai(String username, String token, String awal, String akhir,
          int kelas) =>
      apiProvider.getNilai(username, token, awal, akhir, kelas);

  Future getSyarat() => apiProvider.getSyarat();
}
