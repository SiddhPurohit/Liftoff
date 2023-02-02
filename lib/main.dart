import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:space_flight_recorder/home.dart';
import 'package:space_flight_recorder/main_page.dart';
import 'package:space_flight_recorder/phone.dart';
import 'package:space_flight_recorder/verify.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'main',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home':(context) => MyHome(),
      'main': (context) => main_page()
    },
  )
  );
}