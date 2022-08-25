import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class points_firebase {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  Future<void> addPoints(p1,p2,p3,p4,p5,p6) {
    var res = generateRandomString(30);
    var name = auth.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('points')
        .doc(res)
        .set({'game1': p1,'game2': p2,'game3': p3,'game4': p4,'game5': p5,'game6': p6,'uid': auth.currentUser?.uid,'id':res,'date': DateTime.now().toString()})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
