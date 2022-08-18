// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sih_brain_games/yoga/YVideos.dart';



// class yoga_home extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

class yoga_home extends StatefulWidget {
  const yoga_home({Key? key}) : super(key: key);
  @override
  _yoga_homeState createState() => _yoga_homeState();
}

class _yoga_homeState extends State<yoga_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga Player'),
      ),
      body: getEffectsWidget(),
    );
  }

  getEffectsWidget() {
    return ListView(scrollDirection: Axis.vertical, children: _getListData());
  }

  _getListData() {
    List<Widget> widgets = [];
    ////
    /////
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    widgets.add(Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
      ),
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
      child: Padding(
          padding:
          EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 10.0),
          child: InkWell(
            splashColor: Colors.black,
            //onTap: () {},
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => VideoPlayerApp1()))
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Card(
                      child: Ink.image(
                        image: const AssetImage('assets/1.jpg'),
                        height: 100,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                      elevation: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Mental Yoga',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
    ));

    ////
    ///
    ///
    ///
    ///
    ///
    ///
    widgets.add(Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
      ),
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
      child: Padding(
          padding:
          EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 10.0),
          child: InkWell(
            splashColor: Colors.black,
            //onTap: () {},
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => VideoPlayerApp2()))
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Card(
                      child: Ink.image(
                        image: const AssetImage('assets/2.jpeg'),
                        height: 100,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                      elevation: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Physical Yoga',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
    ));

    ////
    ////
    ///
    ///
    ///
    widgets.add(Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
      ),
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
      child: Padding(
          padding:
          EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 10.0),
          child: InkWell(
            splashColor: Colors.black,
            //onTap: () {},
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => VideoPlayerApp3()))
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Card(
                      child: Ink.image(
                        image: const AssetImage('assets/3.jpg'),
                        height: 100,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                      elevation: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'General Yoga',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
    ));
    return widgets;
  }
}
