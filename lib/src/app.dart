import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raport/src/configs/route_config.dart';
import 'package:raport/src/pages/splash/index.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Comfortaa'),
      debugShowCheckedModeBanner: false,
      title: 'Sekolah Kita',
      initialRoute: SplashPage.routeName,
      getPages: routes,
    );
  }
}
