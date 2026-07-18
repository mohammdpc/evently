import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/Providers/settings_provider.dart';
import 'package:evently/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void signup({
  required String userName,
  required String email,
  required String password,
}) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    setting.user = UserModel.newUser(
      userID: credential.user!.uid,
      userName: userName,
    );
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(credential.user!.uid).set({
      'User Name': userName,
    });
    setting.userEmail = email;
    setting.user = UserModel(userID: credential.user!.uid,userName: userName);
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
  } catch (e) {
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
