

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:sih_brain_games/news/comments.dart';

class News extends StatefulWidget {
  const News(this.headline,this.uid,this.article,this.id,{Key? key}) : super(key: key);
  final headline;
  final uid;
  final article;
  final id;
  static const IconData comment = IconData(0xe17e, fontFamily: 'MaterialIcons');
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final users =
  FirebaseFirestore.instance.collection('content').snapshots();
  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
  Future<void> likecontent(id) {
    var res = generateRandomString(30);
    var name = auth.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('likes')
        .doc(res)
        .set({'uid': auth.currentUser?.uid, 'id': res, 'story': id})
        .then((value) => print("Content Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> dislikecontent(id) {
    var res = generateRandomString(30);
    var name = auth.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('likes')
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          widget.headline,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(

        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(widget.article,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('likes').where('story', isEqualTo: widget.id).where('uid', isEqualTo: auth.currentUser?.uid).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {



          if (snapshot.hasError) {
            return const Text('Somthing when wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }
          final data = snapshot.requireData;
          var name = auth.currentUser?.uid;
          if(data.size == 0)
          return FavoriteButton(
            isFavorite: false,
            // iconDisabledColor: Colors.white,
            valueChanged: (_isFavorite) {
              likecontent(widget.id);
              print('Is Favorite : $_isFavorite');
            },
          );
          else
            return FavoriteButton(
              isFavorite: true,
              // iconDisabledColor: Colors.white,
              valueChanged: (_isFavorite) {
                dislikecontent(data.docs[0]['id']);
                print('Is Favorite : $_isFavorite');
              },
            );
        },
      ),

    );
  }
}
