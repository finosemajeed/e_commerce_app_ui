import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

bool isLoggedIn = false;

class LoginAuthFunction {
  static signInUser(String email, String password, BuildContext context) async {
    var box = await Hive.openBox('LoginData');
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Sucessful')));
      FirebaseAuth.instance.userChanges().listen((User? user) {
        if (user == null) {
          box.put('signin', 'false');
          log('User is currently signed out!');
        } else {
          box.put('signin', 'true');
          if (box.get('signin').toString() == 'true') {
            isLoggedIn = true;
          } else {
            isLoggedIn = false;
          }
          log('User is signed in!');
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      }
    }
  }
}
