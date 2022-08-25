import 'package:flutter/material.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category_Section extends StatefulWidget {
  const Category_Section({Key? key}) : super(key: key);

  @override
  _Category_SectionState createState() => _Category_SectionState();
}

class _Category_SectionState extends State<Category_Section> {
  ValueNotifier<int> pageNum = ValueNotifier(2);

  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('category').snapshots();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color(0xff6053BC),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "News",
                  style: TextStyle(
                      fontSize: 35,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
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
                      shrinkWrap: true,
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return AltButton(
                          title: data.docs[index]['category'],
                          destination: data.docs[index]['category'],
                        );
                      });
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
//
// class headlines extends StatelessWidget {
//   const headlines(
//     this.category, {
//     Key? key,
//   }) : super(key: key);
//
//   final category;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         margin: EdgeInsets.only(bottom: 10),
//         child: ElevatedButton(
//             child: Text(
//               category,
//               style: TextStyle(color: Colors.black),
//             ),
//             style: ElevatedButton.styleFrom(
//                 primary: Color(0xFFFFE1E1),
//                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                 textStyle:
//                     TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => News_Section(category)),
//               );
//             }),
//       ),
//     );
//   }
// }
