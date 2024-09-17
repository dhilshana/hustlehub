import 'package:flutter/material.dart';
import 'package:hastlehub/screens/home.dart';
import 'package:hastlehub/screens/splashScreen.dart';
import 'package:hastlehub/screens/welcomeScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        fontFamily: 'SFProDisplay',
       
      ),
    );
  }
}
