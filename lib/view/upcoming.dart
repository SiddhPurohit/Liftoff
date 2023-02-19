import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:space_flight_recorder/view/details/upcoming_details.dart';
import 'dart:convert';
import '../nav_bar/Nav_Drawer.dart';
import '../nav_bar/bottom_nav_bar.dart';
import 'home.dart';
import 'login/phone.dart';


class LaunchList extends StatefulWidget {
  const LaunchList({Key? key}) : super(key: key);

  @override
  _LaunchListState createState() => _LaunchListState();
}

class _LaunchListState extends State<LaunchList> {
  List<dynamic> launches = [];

  @override
  void initState() {
    super.initState();
    fetchLaunches();
  }

  void fetchLaunches() async {
    final response = await http.get(
      Uri.parse('https://lldev.thespacedevs.com/2.2.0/launch/upcoming/?limit=28')
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      setState(() {
        launches = results;
      });
    } else {
      print('Failed to fetch launches: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav_Drawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Upcoming Launches'),
      ),
      body: launches.isEmpty
          ? Center(child: CircularProgressIndicator())
          :ListView.builder(
        itemCount: launches.length,
        itemBuilder: (context, index) {
          final launch = launches[index];
          final name = launch['name'];
          final net = launch['net'];
          final location = launch['pad']['location']['name'];
          // final mission = launch['mission']['description'];
          
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Launch_details_upcoming(index1: index,),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(

                  backgroundImage: NetworkImage(launch['image'])),
              title: Text(name,
              style: TextStyle(
                color: Colors.white
              ),
              ),
              subtitle: Text('$location\n$net',
              style: TextStyle(
                color: Colors.white
              ),
              ),
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const MyHome()),
      //     );
      //   },
      //   child: const Icon(Icons.timer),
      // ),
      bottomNavigationBar: BottomNavBar(2),
    );
  }
}
