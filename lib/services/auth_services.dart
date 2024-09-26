
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  Future<void> registration(String email,String password) async{
    try{

     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    }
    catch (e){
      rethrow;

    }
  }

  Future<void> login(String email,String password) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      rethrow;
    }
  }

  
}
