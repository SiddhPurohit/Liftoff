import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:space_flight_recorder/nav_bar/bottom_nav_bar.dart';
import 'package:space_flight_recorder/services/launch.dart';
import 'package:space_flight_recorder/services/rocket.dart';
import '../models/post.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // List<Welcome>? posts;
  var isLoaded = false;
  late Timer timer;
  late String countdown;
  late String Exc;

  Post? posts;


  @override
  void initState() {

    super.initState();
    getData();
  }
  getData ()async
  {
    posts = await LaunchService().getPosts();
    countdown='';
    timer = Timer.periodic(Duration(seconds: 1), (timer) {

      if (post != null)
      {
        // var diff = launch.launchUTC.difference(DateTime.now().toUtc());
        // setState(() {
        //   countdown = durationToString(diff);
        // });
      }

    });
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  // String count= postFromJson()
  @override
  Widget build(BuildContext context) {
     // posts = Provider.of<Launch?>(context)!;


    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      
      body: (post != null) ?
      Center(
          child: Column(
            children: [
              // Text(posts),
              Text('')
            ],
          )
      ) :
      Center(
        child: CircularProgressIndicator(),
      ),
      bottomNavigationBar: BottomNavBar(0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        child: Text("Logout"),
      ),
    );

  }
  String durationToString(Duration duration){

      String twoDigits(int n) {
        if (n >= 10) return "$n";
        return "0$n";
      }
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
