import 'package:TeleCon/utils/color_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zego_zimkit/zego_zimkit.dart';

import 'call.dart';

class ChatUI extends StatelessWidget {
  ChatUI({Key? key,required this.email,required this.username}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  var docid;
  var username;
  var email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email,style: TextStyle(fontSize: 18),),
        backgroundColor: hexStringToColor("CB2B93"),
        actions: <Widget>[
          IconButton(
            onPressed: () async {

              ZIMKit().showDefaultNewPeerChatDialog(context);
            }, icon: Icon(Icons.send),

          ),
        ],
      ),
      body:
    Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
    gradient: LinearGradient(colors: [
    hexStringToColor("CB2B93"),
    hexStringToColor("9546C4"),
    hexStringToColor("5E61F4")
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child:  ZIMKitConversationListView(
        onPressed: (context, conversation, defaultAction) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ZIMKitMessageListPage(
                  conversationID: conversation.id,
                  conversationType: conversation.type,
                );
              },
            ),
          );
        },
      ),
    ),
    );
  }

}