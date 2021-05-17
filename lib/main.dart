import 'package:flutter/material.dart';
import 'package:kothon_app/presentation/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kothon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF59E8F1),
        scaffoldBackgroundColor: Color(0xFFF9FAC7),
        fontFamily: 'Nunito',
      ),
      home: SplashScreen(),
    );
  }
}
