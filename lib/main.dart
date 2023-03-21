
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:space_flight_recorder/view/about.dart';
import 'package:space_flight_recorder/view/home.dart';
import 'package:space_flight_recorder/view/main_page.dart';
import 'package:space_flight_recorder/view/login/phone.dart';
import 'package:space_flight_recorder/view/login/verify.dart';
import 'package:space_flight_recorder/view/previous.dart';
import 'package:space_flight_recorder/view/upcoming.dart';

import 'view/Splash screen.dart';
import 'view/login/Name_Email.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // var launchService = LaunchService();
  runApp(MaterialApp(
    initialRoute: 'splash',
    theme: ThemeData(fontFamily: 'Jura'),
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home':(context) => Home1(),
      'main': (context) => main_page(),
      'previous': (context) => PreviousLaunches(),
      'upcoming': (context) => LaunchList(),
      'info': (context) => about(),
      'splash': (context) => RocketAnimation(),
      'details': (context) => Details()
    },
  )
  );
}
