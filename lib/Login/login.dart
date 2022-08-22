import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_brain_games/Login/auth_service.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/unified_screen.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _uid = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  bool isSignUp = true;
  AuthService _auth = AuthService();
  final key = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "OldMan",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.grey.shade800,
                border: Border.all(width: 2, color: Colors.white)),
            child: loading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Center(
                          child: Text(
                        isSignUp ? "Sign Up" : "Login",
                        style: const TextStyle(fontSize: 30),
                      )),
                      const SizedBox(height: 40),
                      Form(
                        key: key,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (val) =>
                                  val == null ? "Cannot be empty" : null,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade900,
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  labelText: "Email ID",
                                  labelStyle: const TextStyle(fontSize: 20)),
                              controller: _uid,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              validator: (val) => val == null || val.length < 6
                                  ? "Enter atleast 6 characters"
                                  : null,
                              obscureText: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade900,
                                  prefixIcon: Icon(Icons.password_outlined),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  labelText: "Password",
                                  labelStyle: TextStyle(fontSize: 20)),
                              controller: _pwd,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
                      RegularButton(
                          onPressed: () async {
                            if (key.currentState!.validate()) {
                              if (isSignUp) {
                                await _auth.createAcc(_uid.text, _pwd.text);
                              } else {
                                await _auth.login(_uid.text, _pwd.text);
                              }
                            }
                          },
                          title: isSignUp ? "Sign Up" : "Login"),
                      isSignUp
                          ? TextButton(
                              onPressed: () {
                                setState(() {
                                  isSignUp = !isSignUp;
                                });
                              },
                              child: Text(
                                isSignUp
                                    ? "Already a user? Login here"
                                    : "Create a new account",
                                style: const TextStyle(fontSize: 17),
                              ))
                          : Container()
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
