import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  Widget displayscore()
  {
    return Container(
      child: ClipRRect(
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
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 56,
              backgroundImage: AssetImage(
                'assets/img.png'
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text("MyName",
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            Text("MyName@gmail.com",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16
              ),),
            SizedBox(
              height: 12,
            ),

          ],
        ),
      ),
    );
  }
}
