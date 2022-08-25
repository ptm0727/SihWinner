import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/dark_mode_provider.dart';

import 'news/news.dart';

// class Button extends StatelessWidget {
//   Widget destination;
//   String imgPath;
//   String title;
//   String? subtitle;
//   Widget? trailing;
//   Button(
//       {required this.imgPath,
//       required this.destination,
//       required this.title,
//       this.subtitle,
//       this.trailing});
//   var darkData;
//   @override
//   Widget build(BuildContext context) {
//     darkData = Provider.of<DarkMode>(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: ExpansionTile(
//           collapsedBackgroundColor:
//               !darkData.dark ? Colors.white : Colors.black,
//           textColor: darkData.dark ? Colors.white : Colors.black,
//           collapsedTextColor: darkData.dark ? Colors.white : Colors.black,
//           title: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(0),
//                 child: ShaderMask(
//                   shaderCallback: (bounds) {
//                     return LinearGradient(
//                       colors: [Colors.white, Colors.transparent],
//                     ).createShader(bounds);
//                   },
//                   child: Image.asset(
//                     imgPath,
//                     height: 100,
//                     width: 300,
//                     fit: BoxFit.cover,
//                   ),
//                   //blendMode: BlendMode.srcATop,
//                 ),
//               ),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 23,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//           children: [
//             ListTile(
//               title: Text(
//                 subtitle ?? "",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w500,
//                   color: darkData.dark ? Colors.white : Colors.black,
//                 ),
//               ),
//               trailing: MaterialButton(
//                 elevation: 0,
//                 color: darkData.dark ? Colors.deepPurple : Colors.green,
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => destination));
//                 },
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30)),
//                 child: Text(
//                   "Play",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: darkData.dark ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//     //   Padding(
//     //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//     //   child: Neumorphic(
//     //     style: darkData.dark
//     //         ? NeumorphicStyle(
//     //             intensity: 0.8,
//     //             depth: 4,
//     //             shadowLightColor: Colors.blueGrey.shade700,
//     //             shadowDarkColor: Color(0xff0B0E12),
//     //             color: Color(0xff333E52),
//     //             boxShape:
//     //                 NeumorphicBoxShape.roundRect(BorderRadius.circular(17)))
//     //         : NeumorphicStyle(
//     //             intensity: 0.7,
//     //             depth: 4,
//     //             shadowLightColor: Colors.white,
//     //             shadowDarkColor: Colors.grey.shade800,
//     //             color: Colors.white70,
//     //             boxShape:
//     //                 NeumorphicBoxShape.roundRect(BorderRadius.circular(17))),
//     //     child: Theme(
//     //       data:
//     //           ThemeData(dividerColor: Colors.transparent, fontFamily: "Nunito"),
//     //       child: ExpansionTile(
//     //           textColor: darkData.dark ? Colors.white : Colors.black,
//     //           title: Padding(
//     //             padding: const EdgeInsets.only(left: 50),
//     //             child: Text(
//     //               title,
//     //               style: TextStyle(
//     //                 fontSize: 26,
//     //                 fontWeight: FontWeight.w500,
//     //                 color: darkData.dark ? Colors.white : Colors.black,
//     //               ),
//     //             ),
//     //           ),
//     //           children: [
//     //             ListTile(
//     //               title: Text(
//     //                 subtitle ?? "",
//     //                 style: TextStyle(
//     //                   fontSize: 17,
//     //                   fontWeight: FontWeight.w500,
//     //                   color: darkData.dark ? Colors.white : Colors.black,
//     //                 ),
//     //               ),
//     //               trailing: MaterialButton(
//     //                 elevation: 0,
//     //                 color: darkData.dark ? Colors.deepPurple : Colors.green,
//     //                 onPressed: () {
//     //                   Navigator.push(context,
//     //                       MaterialPageRoute(builder: (context) => destination));
//     //                 },
//     //                 shape: RoundedRectangleBorder(
//     //                     borderRadius: BorderRadius.circular(30)),
//     //                 child: Text(
//     //                   "Play",
//     //                   style: TextStyle(
//     //                     fontSize: 18,
//     //                     color: darkData.dark ? Colors.white : Colors.black,
//     //                   ),
//     //                 ),
//     //               ),
//     //             )
//     //           ]),
//     //     ),
//     //   ),
//     // );
//   }
// }
class Button extends StatelessWidget {
  Widget destination;
  String imgPath;
  String title;
  String? subtitle;
  Widget? trailing;
  Button(
      {required this.imgPath,
      required this.destination,
      required this.title,
      this.subtitle,
      this.trailing});
  var darkData;
  @override
  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Theme(
          data: ThemeData(dividerColor: Colors.transparent),
          child: ExpansionTile(
            collapsedBackgroundColor:
                !darkData.dark ? Colors.white : Colors.black,
            backgroundColor: !darkData.dark ? Colors.white : Colors.black,
            textColor: darkData.dark ? Colors.white : Colors.black,
            collapsedTextColor: darkData.dark ? Colors.white : Colors.black,
            title: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), //or 15.0
                  child: Container(
                    height: 100.0,
                    width: 300.0,
                    color: Colors.white,
                    child: Image.asset(imgPath),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            children: [
              ListTile(
                title: Text(
                  subtitle ?? "",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: darkData.dark ? Colors.white : Colors.black,
                  ),
                ),
                trailing: MaterialButton(
                  elevation: 0,
                  color: darkData.dark ? Colors.deepPurple : Colors.green,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => destination));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Play",
                    style: TextStyle(
                      fontSize: 18,
                      color: darkData.dark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    //   Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
    //   child: Neumorphic(
    //     style: darkData.dark
    //         ? NeumorphicStyle(
    //             intensity: 0.8,
    //             depth: 4,
    //             shadowLightColor: Colors.blueGrey.shade700,
    //             shadowDarkColor: Color(0xff0B0E12),
    //             color: Color(0xff333E52),
    //             boxShape:
    //                 NeumorphicBoxShape.roundRect(BorderRadius.circular(17)))
    //         : NeumorphicStyle(
    //             intensity: 0.7,
    //             depth: 4,
    //             shadowLightColor: Colors.white,
    //             shadowDarkColor: Colors.grey.shade800,
    //             color: Colors.white70,
    //             boxShape:
    //                 NeumorphicBoxShape.roundRect(BorderRadius.circular(17))),
    //     child: Theme(
    //       data:
    //           ThemeData(dividerColor: Colors.transparent, fontFamily: "Nunito"),
    //       child: ExpansionTile(
    //           textColor: darkData.dark ? Colors.white : Colors.black,
    //           title: Padding(
    //             padding: const EdgeInsets.only(left: 50),
    //             child: Text(
    //               title,
    //               style: TextStyle(
    //                 fontSize: 26,
    //                 fontWeight: FontWeight.w500,
    //                 color: darkData.dark ? Colors.white : Colors.black,
    //               ),
    //             ),
    //           ),
    //           children: [
    //             ListTile(
    //               title: Text(
    //                 subtitle ?? "",
    //                 style: TextStyle(
    //                   fontSize: 17,
    //                   fontWeight: FontWeight.w500,
    //                   color: darkData.dark ? Colors.white : Colors.black,
    //                 ),
    //               ),
    //               trailing: MaterialButton(
    //                 elevation: 0,
    //                 color: darkData.dark ? Colors.deepPurple : Colors.green,
    //                 onPressed: () {
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) => destination));
    //                 },
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(30)),
    //                 child: Text(
    //                   "Play",
    //                   style: TextStyle(
    //                     fontSize: 18,
    //                     color: darkData.dark ? Colors.white : Colors.black,
    //                   ),
    //                 ),
    //               ),
    //             )
    //           ]),
    //     ),
    //   ),
    // );
  }
}

class GradientContainer extends StatelessWidget {
  Widget child;
  GradientContainer({required this.child});

  var darkData;
  @override
  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);
    return Container(
      //padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomCenter,
      //         colors: Provider.of<DarkMode>(context).dark
      //             ? [
      //                 Color(0xFF283240),
      //                 Color(0xFF283240),
      //                 Colors.blueGrey.shade800
      //               ]
      //             : [Colors.lightBlueAccent, Colors.white])
      // ),
      color: darkData.dark ? Colors.black54 : Colors.white,
      child: child,
    );
  }
}

class RegularButton extends StatelessWidget {
  Function() onPressed;
  Widget? leading;
  String title;
  Widget? trailing;
  RegularButton(
      {this.leading,
      required this.onPressed,
      required this.title,
      this.trailing});
  var darkData;
  @override
  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
      child: ListTile(
          tileColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          onTap: onPressed),
    );
  }
}

class AltButton extends StatelessWidget {
  final destination;
  String? imagePath;
  final title;
  Widget? trailing;
  AltButton(
      {this.imagePath,
      required this.destination,
      required this.title,
      this.trailing});
  var darkData;
  @override
  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        onTap: () {
          if (destination is String) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsSection(destination)));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => destination));
          }
        },
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 6,
              ),
              imagePath != null
                  ? Image.asset(
                      imagePath!,
                      height: 100,
                      width: 400,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              const SizedBox(
                height: 6,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //   Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
    //   child: ListTile(
    //       tileColor: Colors.white,
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //       title: Center(
    //         child: Text(
    //           title,
    //           style: const TextStyle(fontSize: 25),
    //         ),
    //       ),
    //       onTap: () {
    //         if (destination is String) {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => NewsSection(destination)));
    //         } else {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => destination));
    //         }
    //       }),
    // );
  }
}
