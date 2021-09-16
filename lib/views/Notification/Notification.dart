import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}


class NotificationPage extends StatefulWidget {
  @override

  createState() => _NotificationScreenState();
}


class _NotificationScreenState extends State<NotificationPage> {

  @override
  build(context)   {


    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    String? message;

    _registerOnFirebase(){
      _fcm.subscribeToTopic('all');
      _fcm.getToken().then((token) => print(token));
    }


    void getMessage(){
      FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
        print('Message receive $remoteMessage');
        print(remoteMessage.notification!.body);
        //if (this.mounted) {
          setState(() => {
            message = remoteMessage.notification!.body,
          });
        //}
        //setState(() => message = remoteMessage.notification!.body);
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
        print('Message receive $remoteMessage');
        print(remoteMessage.notification!.body);
        //if (this.mounted) {
          print('estou aqui');
          if(this.mounted){
            setState(() => {
              message = remoteMessage.notification!.body,
              print('testesetaberto')
            });
          }
        //}
        //setState(() => message = remoteMessage.notification!.body);
      });
    }
    _registerOnFirebase();
    if (this.mounted) {
      getMessage();
    }




    return Scaffold(
        appBar: AppBar(
          title: Text("Notification Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                '$message'
            ),
            ElevatedButton(onPressed: () {
              print('$message');
            }, child: Text('butao'))
          ],
        ),
    );
  }
}