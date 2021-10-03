import 'package:flutter/material.dart';
import 'package:flutterchat/ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterScreen extends StatefulWidget {
  static String registerscreenid = "registerscreen";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: email,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blueAccent)),
                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.blueAccent)),

                hintText: 'Enter the email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              textAlign: TextAlign.center,
              controller: password,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: 'Enter the password',
              ),
            ),
          ),
          RawMaterialButton(

            onPressed: () async{
              setState(() {
              //  showSpinner = true;
              });
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email.text, password: password.text);
                if (newUser != null) {
                  Navigator.pushNamed(context, ChatScreen.chatscreenid);
                }

                setState(() {
                 // showSpinner = false;
                });
              } catch (e) {
                print(e);
              }

            },
            child:Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 15,left: 75,right: 75),
              child: Text("Register"),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            fillColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
