import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:space_flight_recorder/nav_bar/bottom_nav_bar.dart';
import 'package:space_flight_recorder/view/home.dart';
import 'package:space_flight_recorder/view/login/phone.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)
          {
            if(snapshot.hasData)
              {
                return MyHome();
              }
            else
              {
                return MyPhone();
              }
          }
      );

  }
}
