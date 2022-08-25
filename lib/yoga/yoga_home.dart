// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/yoga/YVideos.dart';

import '../dark_mode_provider.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
            child: Divider(
              thickness: 2,
            ),
          ),
          const Center(
            child: Text(
              "Yoga",
              style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
            ),
          ),
          ..._getListData()
        ],
      ),
    );
  }

  // getEffectsWidget() {
  //   return ListView(
  //       physics: ClampingScrollPhysics(),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.vertical,
  //       children: _getListData());
  // }

  _getListData() {
    List<Widget> widgets = [];
    widgets.add(YogaTile(
        textString: 'Mental Yoga',
        imagePath: 'assets/y1.jpg',
        videoPlayerApp: VideoPlayerScreen(
          number: 0,
        )));
    widgets.add(YogaTile(
        textString: 'Physical Yoga',
        imagePath: 'assets/y2.jpeg',
        videoPlayerApp: VideoPlayerScreen(
          number: 1,
        )));
    widgets.add(YogaTile(
        textString: 'General Yoga',
        imagePath: 'assets/y3.jpg',
        videoPlayerApp: VideoPlayerScreen(
          number: 2,
        )));

    return widgets;
  }
}

class YogaTile extends StatelessWidget {
  final videoPlayerApp;
  final imagePath;
  final textString;

  YogaTile(
      {required this.textString,
      required this.imagePath,
      required this.videoPlayerApp});
  var darkData;
  @override
  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
      child: Neumorphic(
        style: darkData.dark
            ? NeumorphicStyle(
                intensity: 0.8,
                depth: 4,
                shadowLightColor: Colors.blueGrey.shade700,
                shadowDarkColor: Color(0xff0B0E12),
                color: Color(0xff333E52),
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(17)))
            : NeumorphicStyle(
                intensity: 0.7,
                depth: 4,
                shadowLightColor: Color(0xffeef2f3),
                shadowDarkColor: Colors.grey.shade800,
                color: Color(0xff83929E),
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(17))),
        child: GestureDetector(
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => videoPlayerApp))
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imagePath,
                  height: 100,
                  width: 400,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  textString,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
