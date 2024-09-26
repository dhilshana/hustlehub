import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hastlehub/firebase_options.dart';
import 'package:hastlehub/services/authCheck.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  AuthCheck(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        fontFamily: 'SFProDisplay',
       
      ),
    );
  }
}
