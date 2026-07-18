import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/Main Screens/main_screen.dart';
import 'package:evently/Providers/settings_provider.dart';
import 'package:evently/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, FirebaseAuthException;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void logIn({required String email,required String password,required BuildContext context}) async {
  String? uid;
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    uid = credential.user!.uid;
    final db = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await db
        .collection('users')
        .doc(uid)
        .get();
    Map<String, dynamic> data = documentSnapshot.data()!;
    setting.user = UserModel(
      userID: uid,
      userName: data['User Name'],
      events: data[''],
    );
    setting.userEmail = email;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(
      msg: e.code,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    return null;
  }catch (e) {
    Fluttertoast.showToast(
      msg: e.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
