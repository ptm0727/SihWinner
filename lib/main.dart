import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/Login/auth_service.dart';
import 'package:sih_brain_games/Login/login.dart';
import 'package:sih_brain_games/game1/data.dart';
import 'package:sih_brain_games/pointsmodel.dart';
import 'package:sih_brain_games/unified_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sih_brain_games/dark_mode_provider.dart';
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
  box = await Hive.openBox<pointsmodel>('points');
  // if (box.isEmpty) {
    box.put(
        'points',
        pointsmodel(
          p1: 0,
          p2: 0,
          p3: 0,
          p4: 0,
          p5: 0,
          p6: 0,
        ));
  // }
  Hive.registerAdapter(denominatormodelAdapter());
  box1 = await Hive.openBox<denominatormodel>('d');
  // if (box1.isEmpty) {
    box1.put('d',
        denominatormodel(d1: 0.1, d2: 0.1, d3: 0.1, d4: 0.1, d5: 0.1, d6: 0.1));
  // }
  runApp(ChangeNotifierProvider<DarkMode>(
      create: (_) => DarkMode(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: Provider.of<DarkMode>(context).dark
                ? ColorScheme.dark()
                : ColorScheme.light(),
            fontFamily: "SF"),
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
