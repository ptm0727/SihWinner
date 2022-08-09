import 'package:flutter/material.dart';
import 'package:sih_brain_games/news/newspage.dart';

class News_Section extends StatefulWidget {
  const News_Section({Key? key}) : super(key: key);

  @override
  _News_SectionState createState() => _News_SectionState();
}

class _News_SectionState extends State<News_Section> {
  ValueNotifier<int> pageNum = ValueNotifier(2);
  PageController _cont = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "News Headlines",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: pageNum,
        builder: (context, int page, child) => PageView(
          controller: _cont,
          children: [
            SingleChildScrollView(
              child: Column(children: [
                headlines('https://picsum.photos/250?image=9',"Headlline","Category"),
              ]),
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
  const headlines(this.image,this.headline,this.category,{
    Key? key,
  }) : super(key: key);
  final image;
  final headline;
  final category;

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
              height: 90,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    headline,
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(category)
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
          MaterialPageRoute(builder: (context) => News()),
        );
      },
    );
  }
}
