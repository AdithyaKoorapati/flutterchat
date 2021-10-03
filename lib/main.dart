import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterchat/LoginScreen.dart';
import 'package:flutterchat/RegistrationScreen.dart';
import 'package:flutterchat/FirstScreen.dart';
import 'package:flutterchat/ChatScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
      routes: {
        FirstScreen.firstscreenid:(context)=>FirstScreen(),
        RegisterScreen.registerscreenid:(context)=>RegisterScreen(),
        LoginScreen.loginscreenid:(context)=>LoginScreen(),
        ChatScreen.chatscreenid:(context)=>ChatScreen(),

      },
    );
  }
}
