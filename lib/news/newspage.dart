import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News(this.headline,this.image,this.article,{Key? key}) : super(key: key);
  final headline;
  final image;
  final article;
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
          color: Color(0xFFFAEAE),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                widget.image,
              ),
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
    );
  }
}
