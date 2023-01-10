import 'dart:developer';

import 'package:e_comerce_app_ui/domain/login_screen/login_auth_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

bool isLoggedIn = false;
void checkLogin() async {
  var box = await Hive.openBox('LoginData');
  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      box.put('signin', 'false');
      log('User is currently signed out!');
    } else {
      box.put('signin', 'true');
      log('User is signed in!');
    }
  });

  if (box.get('signin').toString() == 'true') {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
