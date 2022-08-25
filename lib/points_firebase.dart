import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih_brain_games/pointsmodel.dart';

import 'main.dart';

class points_firebase {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  Future<void> addPoints(p1) {
    var res = generateRandomString(30);
    var name = auth.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('points')
        .doc(res)
        .set({'game': p1,'uid': auth.currentUser?.uid,'id':res,'date': DateTime.now().toString()})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  Future<void> updatescore(var p1) {
    pointsmodel p = box.get('points');
    denominatormodel d = box1.get('d');

    return FirebaseFirestore.instance
        .collection('points')
        .where('uid', isEqualTo: auth.currentUser?.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      var n = querySnapshot.docs.length;
      if (n == 0) {
        FirebaseFirestore.instance
            .collection('points')
            .doc(auth.currentUser?.uid)
            .set({
          'id':auth.currentUser?.uid,

          'game': p1,
          'uid': auth.currentUser?.uid,
          'date': DateTime.now().toString()
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
      else{
        FirebaseFirestore.instance
            .collection('points')
            .doc(auth.currentUser?.uid)
            .update({'game': p1})
            .then((value) => print("User Updated"))
            .catchError((error) => print("Failed to update user: $error"));
      }
      print(n);
    });
  }
}
