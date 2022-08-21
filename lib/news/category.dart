import 'package:flutter/material.dart';
import 'package:sih_brain_games/news/news.dart';
import 'package:sih_brain_games/news/newspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Category_Section extends StatefulWidget {
  const Category_Section({Key? key}) : super(key: key);

  @override
  _Category_SectionState createState() => _Category_SectionState();
}

class _Category_SectionState extends State<Category_Section> {
  ValueNotifier<int> pageNum = ValueNotifier(2);
  PageController _cont = PageController(initialPage: 2);

  final Stream<QuerySnapshot> users =
  FirebaseFirestore.instance.collection('category').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "Category",
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
                            return headlines(
                                data.docs[index]['category']);
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
      this.category,
      {
        Key? key,
      }) : super(key: key);

  final category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
            child: Text(category,style: TextStyle(color: Colors.black),),
            style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFE1E1),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => News_Section(category)),
              );
            }),
      ),
    );
  }
}
