import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginProvider extends ChangeNotifier {
  String emailValidation = '';
  String passwordValidation = '';
  String error = '';
  void signup({required String emailAddress,required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        passwordValidation = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        emailValidation = 'The account already exists for that email.';
      }
    } catch (e) {
      error = e.toString();
    }
  }

  void logIn({required String emailAddress,required String password}) async{

  }

  void signOut () async => await FirebaseAuth.instance.signOut();
}