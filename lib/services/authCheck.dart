import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hastlehub/company/screens/home.dart';
import 'package:hastlehub/users/screens/rootScreen.dart';
import 'package:hastlehub/users/screens/splashScreen.dart';
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
            return const SplashScreen();
          }
          else{
           var currentUser =  FirebaseFirestore.instance.collection('Users').doc(user.uid);

           if(currentUser.id == user.uid){

            return RootScreen();


           }else{

            return HomeScreen();

           }


            
            
          }
        }
        return const Center(
            child: CircularProgressIndicator(
              color: kfontColor,
            ),
          );
      }
      );
  }
}