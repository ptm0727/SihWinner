import 'package:flutter/material.dart';

class Unified extends StatelessWidget {
  ValueNotifier<int> pageNum = ValueNotifier(2);
  PageController _cont = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Home",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: pageNum,
        builder: (context, int page, child) => BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(label: "", icon: Icon(Icons.check_box)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.work)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.smoke_free)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.settings))
          ],
          currentIndex: page,
          onTap: (updatedPage) {
            _cont.animateToPage(updatedPage,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: pageNum,
        builder: (context, int page, child) => PageView(
          controller: _cont,
          children: [
            Container(
              child: Text(
                "Page0",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            Container(
              child: Text(
                "Page1",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            Container(
              child: Text(
                "Page2",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            Container(
              child: Text(
                "Page3",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            Container(
              child: Text(
                "Page4",
                style: TextStyle(fontSize: 30, color: Colors.black),
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
