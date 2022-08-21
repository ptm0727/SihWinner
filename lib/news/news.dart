import 'package:flutter/material.dart';
import 'package:sih_brain_games/news/newspage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class News_Section extends StatefulWidget {
  const News_Section(this.category,{Key? key}) : super(key: key);
  final category;
  @override
  _News_SectionState createState() => _News_SectionState(category);
}

class _News_SectionState extends State<News_Section> {
  ValueNotifier<int> pageNum = ValueNotifier(2);
  PageController _cont = PageController(initialPage: 2);
  var category;
  _News_SectionState(this.category);
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('news').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          category,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: pageNum,
        builder: (context, int page, child) => PageView(
          controller: _cont,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Container(
                  height: 10000000,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: users,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Somthing when wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading');
                      }
                      final data = snapshot.requireData;

                      return ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            if(category == data.docs[index]['category'])
                            return headlines(
                                data.docs[index]['imageURL'],
                                data.docs[index]['headline'],
                                data.docs[index]['category'],
                                data.docs[index]['article']);
                            return SizedBox.shrink();
                          });
                    },
                  ),
                ),
              ),
            ),
          ],
          onPageChanged: (updated) {
            pageNum.value = updated;
          },
        ),
      ),
    );
  }
}

class headlines extends StatelessWidget {
  const headlines(
    this.image,
    this.headline,
    this.category,
      this.article,{
    Key? key,
  }) : super(key: key);
  final image;
  final headline;
  final category;
  final article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Color(0xFFFFE1E1),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Row(
          children: [
            Container(
              child: Image.network(
                image,
              ),
              padding: EdgeInsets.all(9),
              width: 90,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    headline,
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  Text("Category: "+category,
                    style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                  )
                ],
              ),
              padding: EdgeInsets.all(2),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => News(headline,image,article)),
        );
      },
    );
  }
}
