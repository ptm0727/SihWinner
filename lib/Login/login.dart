import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_brain_games/Login/auth_service.dart';
import 'package:sih_brain_games/custom_button.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _uid = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _nick = TextEditingController();
  bool isSignUp = true;
  final AuthService _auth = AuthService();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Color(0xff6053BC),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    isSignUp ? "Sign Up" : "Login",
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  const SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: key,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (val) =>
                                val == null ? "Cannot be empty" : null,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.email_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                labelText: "Email ID",
                                labelStyle: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600)),
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
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.password_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                labelText: "Password",
                                labelStyle: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600)),
                            controller: _pwd,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  RegularButton(
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          if (isSignUp) {
                            var user =
                                await _auth.createAcc(_uid.text, _pwd.text);
                          } else {
                            await _auth.login(_uid.text, _pwd.text);
                          }
                        }
                      },
                      title: isSignUp ? "Sign Up" : "Login"),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isSignUp = !isSignUp;
                        });
                      },
                      child: Text(
                        isSignUp
                            ? "Already a user? Login here"
                            : "Create a new account",
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
