import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hastlehub/screens/rootScreen.dart';
import 'package:hastlehub/screens/splashScreen.dart';
import 'package:hastlehub/utils/constants.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context,snapshot){
        
        if(snapshot.connectionState == ConnectionState.active){
          User? user = snapshot.data;
          if(user == null){
            return SplashScreen();
          }
          else{
            return RootScreen();
          }
        }
        return Center(
            child: CircularProgressIndicator(
              color: kfontColor,
            ),
          );
      }
      );
  }
}