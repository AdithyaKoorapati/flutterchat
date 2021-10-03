import 'package:flutter/material.dart';
import 'package:flutterchat/ChatScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String loginscreenid = "loginscreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: 'Enter the email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: 'Enter the password',
              ),
            ),
          ),
          RawMaterialButton(
            onPressed: () async {
              // final user=_auth.signInWithEmailAndPassword(email: email.text, password: password.text);
              try {
                final user = await _auth.signInWithEmailAndPassword(
                    email: email.text, password: password.text);
                if (user != null) {
                  Navigator.pushNamed(context, ChatScreen.chatscreenid);
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text("LOGIN"),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
