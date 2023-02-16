
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:space_flight_recorder/models/post.dart';
import 'package:space_flight_recorder/services/launch.dart';
import 'package:space_flight_recorder/services/rocket.dart';
import 'package:space_flight_recorder/view/about.dart';
import 'package:space_flight_recorder/view/home.dart';
import 'package:space_flight_recorder/view/main_page.dart';
import 'package:space_flight_recorder/view/login/phone.dart';
import 'package:space_flight_recorder/view/login/verify.dart';
import 'package:space_flight_recorder/view/previous.dart';
import 'package:space_flight_recorder/view/upcoming.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var launchService = LaunchService();
  runApp(FutureProvider(
    create: (context) => launchService.getPosts(),

    initialData: post,
    child: MaterialApp(
      initialRoute: 'main',
      debugShowCheckedModeBanner: false,
      routes: {
        'phone': (context) => MyPhone(),
        'verify': (context) => MyVerify(),
        'home':(context) => MyHome(),
        'main': (context) => main_page(),
        'previous': (context) => previous(),
        'upcoming': (context) => upcoming(),
        'info': (context) => about()
      },
    ),
  )
  );
}