import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


var loggedInUser;

class ChatScreen extends StatefulWidget {
  static String chatscreenid = "chatScreen";


  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final message = TextEditingController();
 // final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();

  }
  void getCurrentUser()async{
    final user =await FirebaseAuth.instance.currentUser;
    if(user!=null){
      loggedInUser=user.email;
    }
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text("chat screen"),
        actions: [
          IconButton(icon: Icon(Icons.close), onPressed: () {}),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Flexible(
            child: StreamBuilder<QuerySnapshot>(
                stream:
                FirebaseFirestore.instance.collection("messages").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    print("Stream builder is builtr");
                    return ListView.builder(
                      reverse: true,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: (snapshot.data as QuerySnapshot).docs.length,
                        itemBuilder: (context, index) {
                          print(index);
                          DocumentSnapshot path = (snapshot.data as QuerySnapshot).docs[index];

                          return Column(
                            crossAxisAlignment:loggedInUser==path["sender"]? CrossAxisAlignment.end:CrossAxisAlignment.start,
                            children: [
                              Text(path["sender"],style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12
                              ),),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Card(

                                    elevation: 10,
                                    color: Colors.lightBlueAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(path["sentmessage"]),
                                    )),
                              )
                            ],
                          );
                        });
                  } else {
                    return Text("Loading");
                  }
                }),
          ),
          TextField(
            controller: message,

            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async{

                    FirebaseFirestore.instance.collection("messages").add({
                      "sender":loggedInUser,
                      "sentmessage":message.text,
                    });
                    message.clear();
                  },
                  child: Icon(Icons.send),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 2, color: Colors.orange),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2)),
                hintText: "enter the message"),
          )
        ],
      ),
    );
  }
}
