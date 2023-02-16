
import 'package:flutter/material.dart';
import 'package:space_flight_recorder/view/about.dart';
import 'package:space_flight_recorder/view/home.dart';
import 'package:space_flight_recorder/view/previous.dart';
import 'package:space_flight_recorder/view/upcoming.dart';


class BottomNavBar extends StatelessWidget {
  int currentindexvalue = 0;
  BottomNavBar(this.currentindexvalue);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.black87,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          // primaryColor: Colors.red,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.yellow))),
      child: BottomNavigationBar(
        backgroundColor: Colors.black87,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restart_alt),
            label: 'Previous',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        currentIndex: currentindexvalue,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        onTap: (int index) {
          currentindexvalue = index;
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHome()));
          }
          if (index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => previous()));
          }

          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => upcoming()));
          }
          if (index == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => about()));
          }
        },
      ),
    );
  }
}
