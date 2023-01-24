import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpFirestoreService {
  static saveUser(String name, email, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name});
  }
}
