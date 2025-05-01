import 'dart:math';

import 'package:TeleCon/screens/signin_screen.dart';
import 'package:TeleCon/utils/color_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:zego_zimkit/zego_zimkit.dart';

import 'ChatUI.dart';
import 'call.dart';

String generateRandomStringAndNumber() {
  String randomString = generateRandomString(4);
  int randomNumber = generateRandomNumber(1000);
  String result = '$randomString$randomNumber';
  return result;
}

String generateRandomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  return String.fromCharCodes(Iterable.generate(
    length,
    (_) => chars.codeUnitAt(random.nextInt(chars.length)),
  ));
}

int generateRandomNumber(int max) {
  Random random = Random();
  return random.nextInt(max);
}

class LinkScreen extends StatefulWidget {
  const LinkScreen({super.key});

  @override
  State<LinkScreen> createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _createmeeting= TextEditingController();
  TextEditingController _joinmeeting= TextEditingController();
  TextEditingController _hintcontroller= TextEditingController();
  bool showTextField = false;
  bool showjoinmeeting = false;
  User? user = FirebaseAuth.instance.currentUser;
  var docid;
  var username=FirebaseAuth.instance.currentUser?.displayName;
  var email = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: hexStringToColor("CB2B93"),
        actions: <Widget>[

          ElevatedButton.icon(onPressed: () async {await ZIMKit().connectUser(id: email!, name: username!);Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChatUI(email: email, username: username,)));}, icon: Icon(Icons.message), label: Text("Message"),),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            children: [

              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').where('email', isEqualTo: user?.email).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                  }
                  else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  else {
                    DocumentSnapshot document = snapshot.data!.docs.first;
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                    docid = document.id;
                    username = data['name'];
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            20, MediaQuery
                            .of(context)
                            .size
                            .height * 0.1, 20, 0),
                        child: Column(
                          children: <Widget>[
                        Container(

                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 15,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),

                          child: ListTile(

                            title: Text(
                              data['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              data['email'],
                              textAlign: TextAlign.center,
                            ),
                      ),
                        ),
                            SizedBox(
                              height: 60,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (!showTextField) {
                                    showTextField = true;
                                    _createmeeting.text =
                                        generateRandomStringAndNumber();
                                  }
                                  else {
                                    showTextField = false;
                                  }
                                });
                              },
                              child: Text('Create a New Meeting'),
                            ),
                            if (showTextField)
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: TextField(
                                          controller: _createmeeting,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          readOnly: true,
                                          decoration: InputDecoration(),
                                        ),
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () {Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MyCall(
                                                  callID: _createmeeting.text,
                                                  UserId: document.id,
                                                  UserName: data['name'],
                                                ),
                                          ),
                                        );},
                                        icon: Icon(Icons.call_outlined),
                                        label: Text(""),
                                      ),
                                    ],
                                  ),
                                ),
                              ),



                            SizedBox(
                              height: 20,
                            ),
                            Text("Or,", textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight
                                  .bold, color: Colors.white70),),

                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (!showjoinmeeting) {
                                    showjoinmeeting = true;
                                    _joinmeeting.text = "";

                                  }
                                  else {
                                    showjoinmeeting = false;
                                  }
                                });
                              },
                              child: Text('Join a Meeting'),
                            ),

                          ],
                        ),
                      ),
                    );
                  }
                }
              ),
              if (showjoinmeeting)
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: 200,
                          child: TextField(
                            controller: _joinmeeting,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter the link",
                            ),
                          ),

                        ),
                      ),


                      ElevatedButton(
                        onPressed: () async {
                           if (_joinmeeting.text != null &&
                              _joinmeeting.text.isNotEmpty) {

                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) =>
                                     MyCall(
                                       callID: _joinmeeting.text,
                                       UserId: docid,
                                       UserName: username!,
                                     ),
                               ),
                             );


                          }
                          else
                          {
                            Fluttertoast.showToast(
                              msg: "Please enter the link",
                              toastLength: Toast.LENGTH_SHORT, // Duration for the toast message
                              gravity: ToastGravity.BOTTOM, // Position of the toast message on the screen
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        },
                        child: Icon(Icons.call_outlined),
                      )
                    ],
                  ),
                ),
              if (showjoinmeeting)
                const SizedBox(
                  height: 110,
                ),
              if (!showjoinmeeting)
                const SizedBox(
                height: 250,
                ),

              SizedBox(
                width: 300,
                child: InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors
                              .white), // Optional: Add a border
                    ),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}









