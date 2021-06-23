import 'package:flutter/material.dart';
import 'package:raport/src/index.dart';
import 'package:raport/src/ui/home_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Comfortaa'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeView(),
        '/login': (context) => LoginView(),
      },
    );
  }
}
