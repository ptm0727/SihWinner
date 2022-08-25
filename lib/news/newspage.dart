

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
  FirebaseFirestore.instance.collection('content');

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
        stream: users.snapshots(),
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
          return FavoriteButton(
            isFavorite: true,
            // iconDisabledColor: Colors.white,
            valueChanged: (_isFavorite) {
              print('Is Favorite : $_isFavorite');
            },
          );
        },
      ),

    );
  }
}
