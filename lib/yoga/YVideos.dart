import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../dark_mode_provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  int number;
  VideoPlayerScreen({required this.number});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  List<String> title = ['Mental Yoga', 'Physical Yoga', 'General Yoga'];
  List<String> dataSource = ['assets/y1.mp4', 'assets/y2.mp4', 'assets/y3.mp4'];
  List<String> asanas = ["Siddhasana", "Vajrasana", "Paschimottanasana"];
  List<String> asanaInfo = [
    'Method: \n\nThis is the most easy pose of Yoga where you sit cross-legged with eyes closed deep in meditation and hands resting on your knees. Sit with your toes tucked into your thighs and set your feet side by side while keeping your knees wide and eyes closed in a meditative pose to ace the seated asana.',
    'Method: \n\nStart by kneeling on the floor and rest your pelvis on your heels. Keep your heels close to each other by pulling your knees and ankles together and point your feet in line with your legs. Place your palms on your knees or on your thighs and adjust your pelvis slightly backward and forward until you re comfortable. Exhale as you sit back on your legs. ',
    'Method: \n\nBegin with Dandasana and place a strap around the feet while grasping them by the hands if the back is stiff. Ensure that your knees are slightly bent and legs stretched out forward.Then inhale and extend your arms straight out to the sides and up over your head, reaching toward the ceiling while keeping your spine erect. As you exhale and empty your stomach of air, begin to come forward by hinging at your hips and place your upper body on your lower body.'
  ];
  Color mainColor = Colors.white;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(dataSource[widget.number])
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var darkData;

  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);
    return Scaffold(
        backgroundColor: darkData.dark ? Color(0xFF283240) : Color(0xff8e9eab),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: darkData.dark ? Colors.white : Colors.black,

          elevation: 0.0,
          title: Center(
              child: Text(
            title[widget.number],
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
          //backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          margin: const EdgeInsets.only(
                              left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
                          child: VideoPlayer(_controller)),
                    )
                  : Container(),

              //video progress indicator
              Container(
                  decoration: const BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                  ),
                  margin: const EdgeInsets.only(
                      left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
                  child: VideoProgressIndicator(_controller,
                      allowScrubbing: true)),

              //following code is for button controller
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _controller.pause();
                      setState(() {
                        _controller = VideoPlayerController.asset(
                            dataSource[widget.number])
                          ..initialize().then((_) {
                            setState(() {});
                          });
                      });
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => VideoPlayerApp3()))
                    },
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 40,
                    ),
                    color: Colors.deepPurpleAccent,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 40,
                    ),
                    color: Colors.deepPurpleAccent,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      _controller.pause();
                      _controller = VideoPlayerController.asset(
                          dataSource[(widget.number + 1) % 3])
                        ..initialize().then((_) {
                          setState(() {
                            widget.number = (widget.number + 1) % 3;
                          });
                        });
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => VideoPlayerApp2()))
                    },
                    icon: const Icon(Icons.skip_next, size: 40),
                    color: Colors.deepPurpleAccent,
                  ),
                ],
              ),
              Text(
                asanas[widget.number],
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  asanaInfo[widget.number],
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

// class VideoPlayerApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Player',
//       home: VideoPlayerScreen1Screen(),
//     );
//   }
// }
//
// class VideoPlayerScreen1Screen extends StatefulWidget {
//   const VideoPlayerScreen1Screen({Key? key}) : super(key: key);
//
//   @override
//   State<VideoPlayerScreen1Screen> createState() =>
//       _VideoPlayerScreen1ScreenState();
// }

// class _VideoPlayerScreen1ScreenState extends State<VideoPlayerScreen1Screen> {
//   Color mainColor = Colors.white;
//   String dataSource = 'assets/y1.mp4';
//   VideoPlayerController _controller =
//       VideoPlayerController.asset('assets/y1.mp4');
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(dataSource)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//     void dispose() {
//       _controller.dispose();
//       super.dispose();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: mainColor,
//         appBar: AppBar(
//           elevation: 0.0,
//           title: Text('Mental Yoga'),
//           backgroundColor: Colors.transparent,
//         ),
//         body: Column(
//           children: [
//             _controller.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(10.0),
//                               bottomRight: Radius.circular(10.0)),
//                         ),
//                         margin: EdgeInsets.only(
//                             left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
//                         child: VideoPlayer(_controller)),
//                   )
//                 : Container(),
//
//             //video progress indicator
//             Container(
//                 decoration: const BoxDecoration(
//                   //color: Colors.blue,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10.0),
//                       bottomRight: Radius.circular(10.0)),
//                 ),
//                 margin: EdgeInsets.only(
//                     left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
//                 child:
//                     VideoProgressIndicator(_controller, allowScrubbing: true)),
//
//             //following code is for butoon controller
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () => {
//                     _controller.pause(),
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => VideoPlayerApp3()))
//                   },
//                   icon: Icon(Icons.skip_previous),
//                   color: Colors.blue,
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     _controller.value.isPlaying
//                         ? _controller.pause()
//                         : _controller.play();
//                   },
//                   icon: Icon(Icons.play_arrow),
//                   color: Colors.blue,
//                 ),
//                 IconButton(
//                   onPressed: () => {
//                     _controller.pause(),
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => VideoPlayerApp2()))
//                   },
//                   icon: Icon(Icons.skip_next),
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//             const Text(
//               "Siddhasana",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Text(
//                 'Method: \n\nThis is the most easy pose of Yoga where you sit cross-legged with eyes closed deep in meditation and hands resting on your knees. Sit with your toes tucked into your thighs and set your feet side by side while keeping your knees wide and eyes closed in a meditative pose to ace the seated asana.',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }

////

// class VideoPlayerApp2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Player',
//       home: VideoPlayerScreen2Screen(),
//       // theme: ThemeData(
//       //     primarySwatch: Colors.purple, //shades of the color
//       //     accentColor: Colors.amber,
//       //     fontFamily: 'Quicksand',
//       //     textTheme: ThemeData.dark().textTheme.copyWith(
//       //         headline6: TextStyle(
//       //             //backgroundColor: Colors.amber,
//       //             fontFamily: 'OpenSans',
//       //             fontSize: 15.0,
//       //             fontWeight: FontWeight.bold)),
//       //     appBarTheme: AppBarTheme(
//       //         titleTextStyle: TextStyle(
//       //             fontFamily: 'OpenSans',
//       //             fontSize: 20,
//       //             fontWeight: FontWeight.bold))),
//     );
//   }
// }
//
// class VideoPlayerScreen2Screen extends StatefulWidget {
//   const VideoPlayerScreen2Screen({Key? key}) : super(key: key);
//
//   @override
//   State<VideoPlayerScreen2Screen> createState() =>
//       _VideoPlayerScreen2ScreenState();
// }
//
// class _VideoPlayerScreen2ScreenState extends State<VideoPlayerScreen2Screen> {
//   Color mainColor = Colors.white;
//   String dataSource = 'assets/y2.mp4';
//   VideoPlayerController _controller =
//       VideoPlayerController.asset('assets/y2.mp4');
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(dataSource)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: mainColor,
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () => {
//               _controller.pause(),
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => yoga_home()))
//             },
//             icon: Icon(Icons.navigate_before),
//           ),
//           elevation: 0.0,
//           title: Text('Physical Yoga'),
//           backgroundColor: Colors.blue,
//         ),
//         body: Column(
//           children: [
//             //now we should check wether the video is loaded
//             _controller.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(10.0),
//                               bottomRight: Radius.circular(10.0)),
//                         ),
//                         margin: EdgeInsets.only(
//                             left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
//                         child: VideoPlayer(_controller)),
//                   )
//                 : Container(),
//
//             //video rogress indicator
//             Container(
//                 decoration: const BoxDecoration(
//                   //color: Colors.blue,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10.0),
//                       bottomRight: Radius.circular(10.0)),
//                 ),
//                 margin: EdgeInsets.only(
//                     left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
//                 child:
//                     VideoProgressIndicator(_controller, allowScrubbing: true)),
//
//             //following code is for butoon controller
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () => {
//                     _controller.pause(),
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => VideoPlayerApp1()))
//                   },
//                   icon: Icon(Icons.skip_previous),
//                   color: Colors.blue,
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     _controller.value.isPlaying
//                         ? _controller.pause()
//                         : _controller.play();
//                   },
//                   icon: Icon(Icons.play_arrow),
//                   color: Colors.blue,
//                 ),
//                 IconButton(
//                   onPressed: () => {
//                     _controller.pause(),
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => VideoPlayerApp3()))
//                   },
//                   icon: Icon(Icons.skip_next),
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//             const Text(
//               "Vajrasana",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Text(
//                 'Method: \n\nStart by kneeling on the floor and rest your pelvis on your heels. Keep your heels close to each other by pulling your knees and ankles together and point your feet in line with your legs. Place your palms on your knees or on your thighs and adjust your pelvis slightly backward and forward until you re comfortable. Exhale as you sit back on your legs. ',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
//
//   void dispose() {
//     _controller.dispose();
//     //chewieController?.dispose();
//     super.dispose();
//   }
// }

// class VideoPlayerApp3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Player',
//       home: VideoPlayerScreen3Screen(),
// theme: ThemeData(
//     primarySwatch: Colors.purple, //shades of the color
//     accentColor: Colors.amber,
//     fontFamily: 'Quicksand',
//     textTheme: ThemeData.dark().textTheme.copyWith(
//         headline6: TextStyle(
//             //backgroundColor: Colors.amber,
//             fontFamily: 'OpenSans',
//             fontSize: 15.0,
//             fontWeight: FontWeight.bold)),
//     appBarTheme: AppBarTheme(
//         titleTextStyle: TextStyle(
//             fontFamily: 'OpenSans',
//             fontSize: 20,
//       //             fontWeight: FontWeight.bold))),
//     );
//   }
// }

// class VideoPlayerScreen3Screen extends StatefulWidget {
//   const VideoPlayerScreen3Screen({Key? key}) : super(key: key);
//
//   @override
//   State<VideoPlayerScreen3Screen> createState() =>
//       _VideoPlayerScreen3ScreenState();
// }
//
// class _VideoPlayerScreen3ScreenState extends State<VideoPlayerScreen3Screen> {
//   Color mainColor = Colors.white;
//   String dataSource = 'assets/y3.mp4';
//   VideoPlayerController _controller =
//       VideoPlayerController.asset('assets/y3.mp4');
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(dataSource)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: mainColor,
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () => {
//               _controller.pause(),
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => yoga_home()))
//             },
//             icon: Icon(Icons.navigate_before),
//           ),
//           elevation: 0.0,
//           title: Text('General Yoga'),
//           backgroundColor: Colors.blue,
//         ),
//         body: Column(
//           children: [
//             //now we should check wether the video is loaded
//             _controller.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(10.0),
//                               bottomRight: Radius.circular(10.0)),
//                         ),
//                         margin: EdgeInsets.only(
//                             left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
//                         child: VideoPlayer(_controller)),
//                   )
//                 : Container(),
//
//             //video rogress indicator
//             Container(
//                 decoration: const BoxDecoration(
//                   //color: Colors.blue,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10.0),
//                       bottomRight: Radius.circular(10.0)),
//                 ),
//                 margin: EdgeInsets.only(
//                     left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
//                 child:
//                     VideoProgressIndicator(_controller, allowScrubbing: true)),
//
//             //following code is for butoon controller
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () => {
//                     _controller.pause(),
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => VideoPlayerApp2()))
//                   },
//                   icon: Icon(Icons.skip_previous),
//                   color: Colors.blue,
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     _controller.value.isPlaying
//                         ? _controller.pause()
//                         : _controller.play();
//                   },
//                   icon: Icon(Icons.play_arrow),
//                   color: Colors.blue,
//                 ),
//                 IconButton(
//                   onPressed: () => {
//                     _controller.pause(),
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => VideoPlayerApp1()))
//                   },
//                   icon: Icon(Icons.skip_next),
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//             const Text(
//               "Paschimottanasana",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Text(
//                 'Method: \n\nBegin with Dandasana and place a strap around the feet while grasping them by the hands if the back is stiff. Ensure that your knees are slightly bent and legs stretched out forward.Then inhale and extend your arms straight out to the sides and up over your head, reaching toward the ceiling while keeping your spine erect. As you exhale and empty your stomach of air, begin to come forward by hinging at your hips and place your upper body on your lower body.',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }
