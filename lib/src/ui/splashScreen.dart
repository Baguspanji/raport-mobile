import 'dart:async';

import 'package:flutter/material.dart';
import 'package:raport/src/helper/uiColor.dart';
import 'package:raport/src/shared/preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token;

  @override
  void initState() {
    getToken().then((value) {
      setState(() {
        if (value == null) {
          token = "0";
        } else {
          token = value;
        }
      });
    });
    Timer(Duration(seconds: 2), () {
      token == "0"
          ? Navigator.pushReplacementNamed(context, '/login')
          : Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colores.info,
      body: Center(
        child: Container(
          width: 300,
          child: Image.asset('assets/images/logo.jpg'),
        ),
      ),
    );
  }
}
