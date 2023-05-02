import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:space_flight_recorder/nav_bar/Nav_Drawer.dart';
import 'package:space_flight_recorder/view/details/previous_details.dart';
import 'dart:convert';
import 'package:space_flight_recorder/view/details/upcoming_details.dart';
import 'package:space_flight_recorder/view/loading.dart';
import '../nav_bar/bottom_nav_bar.dart';
import 'login/phone.dart';

class PreviousLaunches extends StatefulWidget {
  @override
  _PreviousLaunchesState createState() => _PreviousLaunchesState();
}

class _PreviousLaunchesState extends State<PreviousLaunches> {
  List launches = [];
  bool loading = true;

  Future<void> fetchData() async {
    var url = "https://ll.thespacedevs.com/2.2.0/launch/previous";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        launches = data['results'];


      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    loading = false;
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(loading){
      return LoadingScreen();
    }
    return Scaffold(
      drawer:const Nav_Drawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Previous Launches",
        style: TextStyle(
          letterSpacing: 2
        ),
        ),
      ),
      body: Center(
        child:
        ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Previous_details(index1: index,),
                    ),
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Container(

                    height: 100,
                    decoration: BoxDecoration(

                      border: Border.all(color: Colors.white,
                      width: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        colorFilter: new ColorFilter.mode(Colors.black45.withOpacity(0.7), BlendMode.dstATop),
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          launches[index]["image"],

                        ),
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        horizontalTitleGap: 15,
                        title: Text(launches[index]["name"],
                        style: const TextStyle(
                          fontFamily: 'Jura',
                          letterSpacing: 1,
                          color: Colors.white
                        ),
                        ),
                        subtitle: Text(launches[index]["net"],
                          style: const TextStyle(
                              letterSpacing: 2,
                              color: Colors.white

                          ),),
                        trailing: launches[index]["status"]["abbrev"]=="Success"
                            ?const Icon(Icons.check_circle_outline_rounded, color: Colors.green)
                            :const Icon(Icons.close_rounded, color: Colors.red,)

                        // launches[index]["status"]["abbrev"] != 'Success'
                        //     ? launches[index]["status"]["abbrev"]
                        //     ? Icon(Icons.check, color: Colors.green)
                        //     : Icon(Icons.close, color: Colors.red)
                        //     : null,

                      ),
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
