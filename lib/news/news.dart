import 'package:flutter/material.dart';
import 'package:sih_brain_games/news/newspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsSection extends StatefulWidget {
  const NewsSection(this.category, {Key? key}) : super(key: key);
  final category;
  @override
  _NewsSectionState createState() => _NewsSectionState(category);
}

class _NewsSectionState extends State<NewsSection> {
  ValueNotifier<int> pageNum = ValueNotifier(2);
  PageController _cont = PageController(initialPage: 1);
  var category;
  _NewsSectionState(this.category);
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
      body: PageView(
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
                      return const Text('Somthing when wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading');
                    }
                    final data = snapshot.requireData;

                    return ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          if (category == data.docs[index]['category']) {
                            return headlines(
                                data.docs[index]['imageURL'],
                                data.docs[index]['headline'],
                                data.docs[index]['category'],
                                data.docs[index]['article']);
                          }
                          return const SizedBox.shrink();
                        });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class headlines extends StatelessWidget {
  const headlines(
    this.image,
    this.headline,
    this.category,
    this.article, {
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
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Category: " + category,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
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
          MaterialPageRoute(
              builder: (context) => News(headline, image, article)),
        );
      },
    );
  }
}
