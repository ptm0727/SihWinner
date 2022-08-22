

import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:sih_brain_games/news/comments.dart';

class News extends StatefulWidget {
  const News(this.headline,this.image,this.article,this.id,{Key? key}) : super(key: key);
  final headline;
  final image;
  final article;
  final id;
  static const IconData comment = IconData(0xe17e, fontFamily: 'MaterialIcons');
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

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
          Image(
          image: FirebaseImage('gs://siholdman.appspot.com/'+widget.image),
          // Works with standard parameters, e.g.
          fit: BoxFit.fitWidth,
          width: 100,
          // ... etc.
        ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(widget.article,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Comment_Section(widget.headline,widget.id)));
        },
        tooltip: 'Comments',
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
