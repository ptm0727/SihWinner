import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_button.dart';

class music extends StatefulWidget {
  late String a;
  late String b;
  late String c;
  late String d;
  music({required this.a,required this.b,required this.c,required this.d});
  @override
  State<music> createState() => _music();
}

class _music extends State<music>{
  final audioPlayer =AudioPlayer();
  bool isPlaying =false;
  Duration duration= Duration.zero;
  Duration position= Duration.zero;
  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration=newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position=newPosition;
      });
    });
  }
  Future setAudio() async{
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    final player=AudioCache(prefix: 'assets/');
    final url=await player.load(widget.a);
    audioPlayer.setSourceUrl(url.path);
  }
  Widget btnFast(){
    return IconButton(
        onPressed: (){
          position<duration-const Duration(seconds: 10)?setState(() {
            position=position+const Duration(seconds: 10);
            audioPlayer.seek(position);
          }):audioPlayer.seek(position);
        },
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.blueGrey,
        )
    );
  }
  Widget btnSlow(){
    return IconButton(
        onPressed: (){
          position>const Duration(seconds: 10)?setState(() {
            position=position-const Duration(seconds: 10);
            audioPlayer.seek(position);
          }):audioPlayer.seek(position);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.blueGrey,
        )
    );
  }
  @override
  void dispose()
  {
    audioPlayer.dispose();
    super.dispose();
  }
  String formatTime(Duration  duration)
  {
  String twoDigits(int n)=>n.toString().padLeft(2,'0');
  final hours=twoDigits(duration.inHours);
  final minutes=twoDigits(duration.inMinutes.remainder(60));
  final seconds=twoDigits(duration.inSeconds.remainder(60));
  return[
    if(duration.inHours>0) hours,
    minutes,
    seconds,
  ].join(':');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: const Text(
          "Meditation music",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:  Image.asset(widget.b,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(height: 15,),
                 Text(
                  widget.c,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25,),
                 Text(
                  widget.c,
                  style: const TextStyle(fontSize: 20),
                ),
                Slider(
                  activeColor: Colors.purple,
                  inactiveColor: Colors.blueGrey,
                  min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async{
                    final position=Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);

                    await audioPlayer.resume();
                    },
                ),
                 Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(formatTime(position)),
                       Text(formatTime(duration)),
                     ],
                   ),
                 ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      btnSlow(),
                      CircleAvatar(
                        radius: 35,
                        child: IconButton(
                          icon: Icon(
                            isPlaying?Icons.pause:Icons.play_arrow,
                          ),
                          iconSize: 50,
                          color: Colors.blueGrey,
                          onPressed: () async {
                            if(isPlaying)
                              {
                                await audioPlayer.pause();
                              }
                            else{
                              await audioPlayer.resume();
                            }
                          },
                        ),
                      ),
                      btnFast()
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.grey.shade800, Colors.grey.shade900]),
                        //color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 2, color: Colors.cyan)),
                    child: const ExpansionTile(
                        title: Text(
                          "Follow the General Instructions",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        children: [
                          ListTile(
                            title: Text(
                              "1. Sit upright comfortably\n2. Breathe deeply\n3. Gently close your eyes\n4. Slowly scan your body, and notice any sensations\n5. Be aware of any thoughts you are having\n6. When your mind wanders, focus on your breath\n7. Gently open your eyes when you are ready",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          )
                        ]),
                  ),
                ),
                
                /*const Text(
                  "Follow the General Instructions",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("1. Sit upright comfortably\n2. Breathe deeply\n3. Gently close your eyes\n4. Slowly scan your body, and notice any sensations\n5. Be aware of any thoughts you are having\n6. When your mind wanders, focus on your breath\n7. Gently open your eyes when you are ready"),
                const SizedBox(height: 32,),
                ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back To Music",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))*/
              ],
            ),
          ),
        ),
    );

  }
}
