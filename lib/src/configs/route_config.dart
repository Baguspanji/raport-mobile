import 'package:get/route_manager.dart';
import 'package:raport/src/pages/auth/login.dart';
import 'package:raport/src/pages/home/index.dart';
import 'package:raport/src/pages/splash/index.dart';

final List<GetPage<dynamic>>? routes = [
  GetPage(
    name: SplashPage.routeName,
    page: () => SplashPage(),
  ),
  GetPage(
    name: LoginPage.routeName,
    page: () => LoginPage(),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => HomePage(),
  ),
  // GetPage(
  //   name: TentangUI.routeName,
  //   page: () => TentangUI(),
  //   arguments: CommonArgument<String>,
  // ),
];

class CommonArgument<T> {
  final T? object;
  final int? id;

  const CommonArgument({this.object, this.id});
}
