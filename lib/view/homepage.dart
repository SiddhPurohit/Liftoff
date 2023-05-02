import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:space_flight_recorder/nav_bar/Nav_Drawer.dart';
import 'package:space_flight_recorder/nav_bar/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'details/previous_details.dart';
import 'details/upcoming_details.dart';
import 'loading.dart';
import 'login/Name_Email.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List launches = [];
  List news = [];
  List uLaunches=[];
  String name='';
  DateTime ulaunchTime = DateTime.now();
  String time = '';
  String time1 = '';
  String localTime = "";
  String imgSrc="";
  bool loading1 = true;
  bool loading2 = true;
  bool loading3 = true;
  Future<void> fetchUpcoLaunches() async {
    final response = await http.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/launch/upcoming/'));

    if (response.statusCode == 200) {
      setState(() {
        uLaunches = jsonDecode(response.body)['results'];

          final uLaunch=uLaunches.elementAt(0);

          final name1 = uLaunch['name'];
          name = name1.toString();

          final launchTimeStr = uLaunch['net'];
          ulaunchTime = DateTime.parse(launchTimeStr).toLocal();
          time1 = ulaunchTime.toString();
          final image = uLaunch['image'];
          imgSrc = image;


      });
    } else {
      throw Exception('Failed to load launches');
    }
    loading1 = false;
  }

  Future<void> fetchPrevLaunches() async {
    final response =
    await http.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/launch/previous/'));

    if (response.statusCode == 200) {

        launches = jsonDecode(response.body)['results'];


    } else {
      throw Exception('Failed to load launches');
    }
    loading2 = false;
  }

  Future<void> fetchNews() async {
    final response =
    await http.get(Uri.parse('https://api.spaceflightnewsapi.net/v3/articles'));
    if (response.statusCode == 200) {
      setState(() {
        news = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load news');
    }

    print('Url is ='+news[0]['url']);
    loading3 = false;
  }

  @override
  void initState() {
    super.initState();
    fetchPrevLaunches();
    fetchUpcoLaunches();
    fetchNews();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => updateCountdown());
    if (FirebaseAuth.instance.currentUser!.displayName == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Details()));
    }
  }
  void updateCountdown() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    if ((loading1||loading2)||(loading3)){
      return LoadingScreen();
    }
    final now = DateTime.now().toLocal();
    final duration = ulaunchTime.difference(now);
    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    final final_time = time1.split(" ");
    final date_final = final_time.elementAt(0).toString();
    final time_final = final_time.elementAt(1).toString();
    final time11 = time_final.split(".");
    localTime = time11.elementAt(0).toString();
    return
       Scaffold(
         backgroundColor: Colors.black,
        drawer: const Nav_Drawer(),
        appBar: AppBar(

          backgroundColor: Colors.black,
          title: Text('Welcome '+ FirebaseAuth.instance.currentUser!.displayName.toString()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Upcoming_details(index1: 0,),
                      ),
                    );
                  },
                  child: Center(
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.4),BlendMode.srcOver
                                  ),

                                  fit: BoxFit.cover,
                                  image: NetworkImage(imgSrc,

                                  )
                              )
                          ),
                          height: 280,
                          child: Center(
                            child: Container(
                              height: 350,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$days : $hours : $minutes : $seconds',
                                    style: const TextStyle(fontSize: 30, color: Colors.white,),
                                  ),
                                  Text(
                                    '$days Days : $hours Hours : $minutes Minutes : $seconds Seconds',
                                    style: const TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                  const Text('Until the Launch',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // CarouselSlider(
                        //   items: [
                        //     Image.network(
                        //       imgSrc,
                        //         color: Colors.black45,
                        //         colorBlendMode: BlendMode.darken,
                        //
                        //     ),
                        //   ],
                        //   options: CarouselOptions(
                        //     height: 300,
                        //     // height: 200.0,
                        //     // enlargeCenterPage: true,
                        //     autoPlay: false,
                        //     autoPlayInterval: Duration(seconds: 7),
                        //     enableInfiniteScroll: true,
                        //     autoPlayAnimationDuration: Duration(seconds: 3),
                        //     viewportFraction: 1,
                        //
                        //
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold
                                ),
                                maxLines: 2,
                              ),
                              // Text(missionType,
                              //   style: TextStyle(
                              //     color: Colors.grey,
                              //     fontSize: 14,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text('Previous Launches',
                  style: TextStyle(
                      color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                ),
                Container(
                  height: 100,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: launches.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Previous_details(index1: index,),
                              ),
                            );
                          },
                          child: Container(
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4),BlendMode.srcOver),
                                    fit: BoxFit.cover,
                                    image: NetworkImage(launches[index]['image'],

                                    )
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(2, 1, 2, 4),
                                          child: SizedBox(
                                            width: 230,
                                            child: Text(
                                              launches[index]['name'],
                                              style: const TextStyle(fontSize: 14.0,
                                                  color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.fade,
                                              ),
                                              // maxLines: 2,
                                            ),
                                          ),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(2, 4, 2, 1),
                                        child: Text(launches[index]['net'],
                                        style: const TextStyle(
                                          color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  (launches[index]["status"]["abbrev"]=="Success"
                                      ?const Icon(Icons.check_circle_outline_rounded, color: Colors.green)
                                      :const Icon(Icons.close_rounded, color: Colors.red,))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );

                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text('News',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28
                    ),
                    ),
                  ),
                ),
                Container(
                  height: 1000,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: news.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          trailing: SizedBox(
                            width: 60,
                            height: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(

                                news[index]['imageUrl'],
                                height: 80.0,
                                width: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(news[index]['title'],
                          style: const TextStyle(
                            color: Colors.white
                          ),
                          ),
                          subtitle: Row(
                            children: [
                              // SizedBox(
                              //   width: 150,
                              //   child: Text(news[index]['publishedAt'],
                              //     style: TextStyle(
                              //         color: Colors.white
                              //     ),
                              //     maxLines: 2,
                              //   ),
                              //
                              // ),
                              Text(news[index]['newsSite'],
                                style: const TextStyle(
                                    color: Colors.grey
                                ),)
                            ],
                          ),
                          onTap: () async{
                            final url = news[index]['url'];
                            // final Uri uri = Uri.parse(url);
                            await launchUrlString(url,
                              mode: LaunchMode.externalApplication
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
         bottomNavigationBar: BottomNavBar(0),
      );

  }
}
