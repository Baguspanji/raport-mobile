import 'package:get/get.dart';
import 'package:raport/src/controllers/user_detail_model.dart';
import 'package:raport/src/models/auth_model.dart';
import 'package:raport/src/repository/api.dart';

class AuthController extends GetxController {
  final api = Api();

  final authData = AuthModel().obs;
  final userDetailData = UserDetailModel().obs;

  Future<String> authentication(
      {required String user, required String pass}) async {
    try {
      var res = await api.authentication(user, pass);

      if (res.statusCode == 200) {
        authData.value = res.body['status'] == true
            ? AuthModel.fromJson(res.body['data'])
            : AuthModel();
        return res.body['message'];
      } else {
        return res.body['message'];
      }
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<String> getUser() async {
    try {
      var res = await api.getUser();

      if (res.statusCode == 200) {
        userDetailData.value = res.body['status'] == true
            ? UserDetailModel.fromJson(res.body['data'])
            : UserDetailModel();
        return res.body['message'];
      } else {
        return res.body['message'];
      }
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
