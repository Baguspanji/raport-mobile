import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raport/src/configs/constans_config.dart';
import 'package:raport/src/configs/constants_assets.dart';
import 'package:raport/src/pages/auth/login.dart';
import 'package:raport/src/pages/home/index.dart';
import 'package:raport/src/repository/s_preference.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "/splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String token = '';

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    String value = await getToken();

    Timer(Duration(seconds: 2), () {
      if (value == null && value == '') {
        Get.toNamed(LoginPage.routeName);
      } else {
        Get.toNamed(HomePage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInfoColor,
      body: Center(
        child: Container(
          width: 300,
          child: Image.asset(logo),
        ),
      ),
    );
  }
}
