import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class RecibiendoMensajes{
  
  FirebaseMessaging mensaje = FirebaseMessaging.instance;
  
  notification(){
    mensaje.requestPermission();
    mensaje.getToken().then((token){
      print("*********000000000000000**********");
      print(token);
    });

  }
}
