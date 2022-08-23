import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/Login/auth_service.dart';
import 'package:sih_brain_games/Login/login.dart';
import 'package:sih_brain_games/game1/data.dart';
import 'package:sih_brain_games/pointsmodel.dart';
import 'package:sih_brain_games/unified_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

late Box box;
late Box box1;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(pointsmodelAdapter());
  box=await Hive.openBox<pointsmodel>('points');
  //pointsmodel xyz=box.get('points');
  /*double a1=xyz.p1;
  double a2=xyz.p2;
  double a3=xyz.p3;
  double a4=xyz.p4;
  double a5=xyz.p5;
  double a6=xyz.p6;*/
  //box.put('points',pointsmodel(p1: 0, p2: 0, p3: 0, p4: 0, p5: 0, p6: 0,d1: 1, d2: 1, d3: 1, d4: 1, d5: 1, d6: 1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.dark(), fontFamily: "Nunito"),
        home: StreamProvider<User?>.value(
            value: AuthService().user, initialData: null, child: Dummy()));
  }
}

class Dummy extends StatelessWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<User?>(context) is User)
      return Unified();
    else
      return Login();
  }
}
