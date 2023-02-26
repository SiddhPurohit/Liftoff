import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:space_flight_recorder/nav_bar/Nav_Drawer.dart';
import 'dart:convert';

import 'package:space_flight_recorder/view/details/previous_details.dart';

import '../nav_bar/bottom_nav_bar.dart';
import 'login/phone.dart';

class PreviousLaunches extends StatefulWidget {
  @override
  _PreviousLaunchesState createState() => _PreviousLaunchesState();
}

class _PreviousLaunchesState extends State<PreviousLaunches> {
  List launches = [];

  Future<void> fetchData() async {
    var url = "https://lldev.thespacedevs.com/2.2.0/launch/previous/?limit=110";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        launches = data['results'];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Nav_Drawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Previous Launches",
        style: TextStyle(
          letterSpacing: 2
        ),
        ),
      ),
      body: Center(
        child: launches.isEmpty
            ? CircularProgressIndicator(color: Colors.blueAccent,)
            :
        ListView.builder(
          itemCount: launches.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Launch_details(index1: index,),
                    ),
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,
                      width: 0.3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(launches[index]["image"]),
                      ),
                    ),
                    child: ListTile(
                      horizontalTitleGap: 15,
                      title: Text(launches[index]["name"],
                      style: TextStyle(
                        fontFamily: 'Jura',
                        letterSpacing: 1,
                        color: Colors.white
                      ),
                      ),
                      subtitle: Text(launches[index]["net"],
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.white

                        ),),
                      trailing: launches[index]["status"]["abbrev"]=="Success"
                          ?Icon(Icons.check_circle_outline_rounded, color: Colors.green)
                          :Icon(Icons.close_rounded, color: Colors.red,)

                      // launches[index]["status"]["abbrev"] != 'Success'
                      //     ? launches[index]["status"]["abbrev"]
                      //     ? Icon(Icons.check, color: Colors.green)
                      //     : Icon(Icons.close, color: Colors.red)
                      //     : null,

                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
