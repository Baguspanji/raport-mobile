import 'package:raport/src/models/absenModel.dart';
import 'package:raport/src/models/bayarModel.dart';
import 'package:raport/src/models/detailModel.dart';
import 'package:raport/src/models/kelasModel.dart';
import 'package:raport/src/models/loginModel.dart';
import 'package:raport/src/models/nilaiModel.dart';
import 'package:raport/src/models/resData.dart';
import 'package:raport/src/models/syaratModel.dart';
import 'package:raport/src/providers/repositories.dart';
import 'package:rxdart/rxdart.dart';

class UsersBloc {
  final _repository = Repositories();
  final _loginFetcher = PublishSubject<LoginModel>();
  final _passwordFetcher = PublishSubject<ResData>();
  final _kelasFetcher = PublishSubject<KelasModel>();
  final _detailFetcher = PublishSubject<DetailModel>();
  final _absenFetcher = PublishSubject<AbsenModel>();
  final _bayarFetcher = PublishSubject<BayarModel>();
  final _nilaiFetcher = PublishSubject<NilaiModel>();
  final _syaratFetcher = PublishSubject<SyaratModel>();

  PublishSubject<LoginModel> get resLogin => _loginFetcher.stream;
  PublishSubject<ResData> get resPassword => _passwordFetcher.stream;
  PublishSubject<KelasModel> get resKelas => _kelasFetcher.stream;
  PublishSubject<DetailModel> get resDetail => _detailFetcher.stream;
  PublishSubject<AbsenModel> get resAbsen => _absenFetcher.stream;
  PublishSubject<BayarModel> get resBayar => _bayarFetcher.stream;
  PublishSubject<NilaiModel> get resNilai => _nilaiFetcher.stream;
  PublishSubject<SyaratModel> get resSyarat => _syaratFetcher.stream;

  login(String username, String pass, String token) async {
    try {
      LoginModel resLoginModel = await _repository.login(username, pass, token);
      _loginFetcher.sink.add(resLoginModel);
    } catch (error) {
      _loginFetcher.sink.add(error);
      print(error);
    }
  }

  ubah_pass(String username, String pass, String token) async {
    try {
      ResData resPassModel =
          await _repository.getPassword(username, pass, token);
      _passwordFetcher.sink.add(resPassModel);
    } catch (error) {
      _passwordFetcher.sink.add(error);
      print(error);
    }
  }

  getKelas(String username, String token) async {
    try {
      KelasModel resKelasModel = await _repository.getKelas(username, token);
      _kelasFetcher.sink.add(resKelasModel);
    } catch (error) {
      _kelasFetcher.sink.add(error);
      print(error);
    }
  }

  getDetail(String username, String token) async {
    try {
      DetailModel resDetailModel = await _repository.getDetail(username, token);
      _detailFetcher.sink.add(resDetailModel);
    } catch (error) {
      _detailFetcher.sink.add(error);
      print(error);
    }
  }

  getAbsen(String username, String token, String awal, String akhir) async {
    try {
      AbsenModel resAbsenModel =
          await _repository.getAbsen(username, token, awal, akhir);
      _absenFetcher.sink.add(resAbsenModel);
    } catch (error) {
      _absenFetcher.sink.add(error);
      print(error);
    }
  }

  getBayar(String username, String token, String awal, String akhir, int kelas,
      int semester) async {
    try {
      BayarModel resBayarModel = await _repository.getBayar(
          username, token, awal, akhir, kelas, semester);
      _bayarFetcher.sink.add(resBayarModel);
    } catch (error) {
      _bayarFetcher.sink.add(error);
      print(error);
    }
  }

  getNilai(String username, String token, String awal, String akhir,
      int kelas) async {
    try {
      NilaiModel resNilaiModel =
          await _repository.getNilai(username, token, awal, akhir, kelas);
      _nilaiFetcher.sink.add(resNilaiModel);
    } catch (error) {
      _nilaiFetcher.sink.add(error);
      print(error);
    }
  }

  getSyarat() async {
    try {
      SyaratModel resSyaratModel = await _repository.getSyarat();
      _syaratFetcher.sink.add(resSyaratModel);
    } catch (error) {
      _syaratFetcher.sink.add(error);
      print(error);
    }
  }

  dispose() {
    _loginFetcher.close();
    _passwordFetcher.close();
    _kelasFetcher.close();
    _detailFetcher.close();
    _absenFetcher.close();
    _bayarFetcher.close();
    _nilaiFetcher.close();
    _syaratFetcher.close();
  }
}

final blocUsers = UsersBloc();
