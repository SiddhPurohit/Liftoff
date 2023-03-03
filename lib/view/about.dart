import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_flight_recorder/nav_bar/Nav_Drawer.dart';
import 'package:space_flight_recorder/nav_bar/bottom_nav_bar.dart';


class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return
         Scaffold(
          appBar: AppBar(
            title: Text("About",
            style: TextStyle(

            ),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          drawer: Nav_Drawer(),
          backgroundColor: Colors.black,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                Image.asset('assets/images/about_logo.png',
                height: 150,
                ),
                SizedBox(height: 60),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                        'assets/images/profile_pics/siddh.png'
                        ),
                        radius: 25,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Siddh Purohit",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Divider(
                              endIndent: 1,
                              indent: 1,
                              thickness: 0.5,
                              height: 2,
                              color: Colors.white,
                            ),
                            Text(
                              "Project Leader",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/profile_pics/reyansh.png'
                        ),
                        radius: 23,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reyansh Sawant",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Divider(
                              endIndent: 1,
                              indent: 1,
                              thickness: 0.5,
                              height: 2,
                              color: Colors.white,
                            ),
                            Text(
                              "Developer",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                  backgroundImage: AssetImage(
                  'assets/images/profile_pics/kaustubh.png'
                  ),
                        radius: 23,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kaustubh Gaikwad",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Divider(
                              endIndent: 1,
                              indent: 1,
                              thickness: 0.5,
                              height: 2,
                              color: Colors.white,
                            ),
                            Text(
                              "Designer",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/profile_pics/krish.png'
                        ),
                        radius: 23,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Krish Trivedi",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Divider(
                              endIndent: 1,
                              indent: 1,
                              thickness: 0.5,
                              height: 2,
                              color: Colors.white,
                            ),
                            Text(
                              "Designer",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.linkedinIn,
                              color: Colors.white,
                              size: 30,
                            )),
                        VerticalDivider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                              size: 30,
                            )),
                        VerticalDivider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                              size: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ]),
           bottomNavigationBar: BottomNavBar(3),
        );

  }
}
