import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutterchat/LoginScreen.dart';
import 'package:flutterchat/RegistrationScreen.dart';
import 'LoginScreen.dart';


class FirstScreen extends StatefulWidget {
  static String firstscreenid = "firstscreen";


  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TypewriterAnimatedTextKit(
                text: ["Flutter Chat"],
                textStyle: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                speed: Duration(milliseconds: 120),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RawMaterialButton(
                onPressed: () {

                  Navigator.pushNamed(context, LoginScreen.loginscreenid) ;
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 80,right: 80),
                  child: Text("LogIn"),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                fillColor: Colors.lightBlueAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RawMaterialButton(
                onPressed: () {

                  Navigator.pushNamed(context, RegisterScreen.registerscreenid);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 75,right: 75),
                  child: Text("Register"),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                fillColor: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
