import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_flight_recorder/nav_bar/Nav_Drawer.dart';
import 'package:space_flight_recorder/nav_bar/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';


class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return
         Scaffold(
          appBar: AppBar(
            title: const Text("About",
            style: TextStyle(

            ),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),

          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Image.asset('assets/images/about_logo.png',
                  height: 150,
                  ),
                  const SizedBox(height: 60),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 15),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                          'assets/images/profile_pics/siddh.png'
                          ),
                          radius: 25,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                child: const Text(
                                  "Siddh Purohit",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onTap: (){
                                  launchUrlString('https://www.linkedin.com/in/siddh-purohit-1872a122a/',
                                      mode: LaunchMode.externalNonBrowserApplication
                                  );

                                },
                              ),
                              const Divider(
                                endIndent: 1,
                                indent: 1,
                                thickness: 0.5,
                                height: 2,
                                color: Colors.white,
                              ),
                              const Text(
                                "Project Leader",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 15),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/profile_pics/reyansh.png'
                          ),
                          radius: 23,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: ()
                                {
                                  launchUrlString('https://www.linkedin.com/in/reyansh-sawant-97617b244',
                                      mode: LaunchMode.externalNonBrowserApplication
                                  );
                                },
                                child: const Text(
                                  "Reyansh Sawant",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                              const Divider(
                                endIndent: 1,
                                indent: 1,
                                thickness: 0.5,
                                height: 2,
                                color: Colors.white,
                              ),
                              const Text(
                                "Developer",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 15),
                    child: Row(
                      children: [
                        const CircleAvatar(
                    backgroundImage: AssetImage(
                    'assets/images/profile_pics/kaustubh.png'
                    ),
                          radius: 23,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                child: const Text(
                                  "Kaustubh Gaikwad",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onTap: ()
                                {
                                  launchUrlString('https://www.linkedin.com/in/kaustubh-gaikwad-56a32a244',
                                      mode: LaunchMode.externalNonBrowserApplication
                                  );
                                },
                              ),
                              const Divider(
                                endIndent: 1,
                                indent: 1,
                                thickness: 0.5,
                                height: 2,
                                color: Colors.white,
                              ),
                              const Text(
                                "Designer",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 15),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/profile_pics/krish.png'
                          ),
                          radius: 23,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                child: const Text(
                                  "Krish Trivedi",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onTap: ()
                                {
                                    launchUrlString('https://www.linkedin.com/in/krish-trivedi-3bb895268',
                                        mode: LaunchMode.externalNonBrowserApplication
                                    );
                                },
                              ),
                              const Divider(
                                endIndent: 1,
                                indent: 1,
                                thickness: 0.5,
                                height: 2,
                                color: Colors.white,
                              ),
                              const Text(
                                "Designer",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  Center(
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const VerticalDivider(
                            thickness: 2,
                            color: Colors.white,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.linkedinIn,
                                color: Colors.white,
                                size: 30,
                              )),
                          const VerticalDivider(
                            thickness: 2,
                            color: Colors.white,
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ]),
          ),
           // bottomNavigationBar: BottomNavBar(3),
        );

  }
}
