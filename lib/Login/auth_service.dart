import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih_brain_games/math_game/math_result.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  void signOut() async {
    try {
      await _auth.signOut();
    } on Exception catch (e) {
      print("error while calling signOut");
      print(e);
    }
  }

  String? getDisplayName() {
    String? disp = _auth.currentUser!.displayName;
    return disp;
  }

  Future<User?> createAcc(String email, String pwd) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      print("signed in");
      return result.user;
    } on Exception catch (e) {
      print("error while calling createUserWithEmailAndPassword");
      print(e);
    }
  }

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<User?> login(String email, String pwd) async {
    try {
      final result =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      return result.user;
    } on Exception catch (e) {
      print("error while calling signInWithEmailAndPassword");
    }
  }
}
