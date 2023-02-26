
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:space_flight_recorder/nav_bar/bottom_nav_bar.dart';


class Launch_details_upcoming extends StatefulWidget {

  final int index1;


  Launch_details_upcoming({required this.index1});

  @override
  _Launch_details_upcomingState createState() => _Launch_details_upcomingState();
}

class _Launch_details_upcomingState extends State<Launch_details_upcoming> {

  DateTime launchTime = DateTime.now();
  String Name='';
  String description='';
  String agencyName='';
  String type = '';
  String rocketName='';
  String rocketVariant='';
  String missionName='';
  String orbitName='';
  String location='';
  String time='';
  String date = '';
  String image='';
  bool loading = true;
  String? error;




  @override
  void initState() {
    super.initState();
    fetchLaunch_details_upcoming(widget.index1);
    Timer.periodic(Duration(seconds: 1), (Timer t) => updateCountdown());

  }

  void fetchLaunch_details_upcoming(index) async {
    final response = await http.get(
        Uri.parse('https://lldev.thespacedevs.com/2.2.0/launch/upcoming/?limit=28')
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      if (results.isNotEmpty) {
        final launch = results.elementAt(index);
        final launchTimeStr = launch['net'];
        launchTime = DateTime.parse(launchTimeStr).toLocal();
        final Launchname = launch['name'];
        Name = Launchname.toString();
        final descp = launch['mission']['description'];
        description=descp;
        final agenName=launch['launch_service_provider']['name'];
        agencyName=agenName;
        final typee=launch['launch_service_provider']['type'];
        type=typee;
        final r_name=launch['rocket']['configuration']['name'];
        rocketName=r_name;
        final r_variant=launch['rocket']['configuration']['variant'];
        rocketVariant=r_variant;
        final m_name=launch['mission']['name'];
        missionName=m_name;
        final orbit_name=launch['mission']['orbit']['name'];
        orbitName=orbit_name;
        final pad_location=launch['pad']['location']['name'];
        location=pad_location;
        final estimated_time=launch['net'];
        time=estimated_time;
        final image_src=launch['image'];
        image=image_src;
        if(type==null){
          type='';
        }

        setState(() {});
      } else {
        print('No upcoming launches found');
      }
    } else {
      error = 'Failed to fetch upcoming launches';
      print('Failed to fetch upcoming launches: ${response.statusCode}');
    }
    loading = false;
    setState(() {});
  }

  void updateCountdown() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.blueAccent,),),);
    }
    if (error != null) {
      return Scaffold(body: Center(child: Text(error!),),);
    }
    final now = DateTime.now().toLocal();
    final duration = launchTime.difference(now);
    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    final final_time = time.split("T");
    final date_final = final_time.elementAt(0).toString();
    final time_final = final_time.elementAt(1).toString();
    return Scaffold(
      backgroundColor: Colors.black54,

      appBar: AppBar(

        backgroundColor: Colors.black,
        title: const Text('Welcome'),
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Upcoming Launch',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24),
            ),
            const SizedBox(height: 20),

            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(image),
                // CarouselSlider(
                //   items: [
                //     Image.network('https://c4.wallpaperflare.com/wallpaper/559/511/583/spacex-rocket-falcon-9-smoke-wallpaper-preview.jpg'),
                //     Image.network('https://c4.wallpaperflare.com/wallpaper/81/233/257/spacex-rocket-smoke-cape-canaveral-wallpaper-preview.jpg'),
                //     Image.network('https://c4.wallpaperflare.com/wallpaper/758/798/536/spacex-rocket-launch-pads-falcon-heavy-wallpaper-preview.jpg'),
                //     Image.network('https://cdnn1.img.sputniknews.com/img/07e6/0a/17/1102543952_0:0:3071:1728_1920x0_80_0_0_94bf3eb33e85402d96a49a4e84e93b84.jpg'),
                //     Image.network('https://static.theprint.in/wp-content/uploads/2018/03/6-01-e1530068959485.jpg?compress=true&quality=80&w=376&dpr=2.6'),
                //     Image.network('https://c4.wallpaperflare.com/wallpaper/390/31/781/spacex-rocket-falcon-9-wallpaper-preview.jpg'),
                //   ],
                //   options: CarouselOptions(
                //     height: 300,
                //     // height: 200.0,
                //     // enlargeCenterPage: true,
                //     autoPlay: false,
                //     enableInfiniteScroll: true,
                //     autoPlayAnimationDuration: Duration(seconds: 3),
                //     viewportFraction: 1,
                //   ),
                // ),
                Column(
                  children: [
                    Text(
                      '$days : $hours : $minutes : $seconds',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      'Days : Hours : Minutes : Seconds',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(height: 20,),
            Text(Name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.white,
                  ),
                  Text('Description:',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14
                    ),
                  ),

                  SizedBox(height: 4),
                  Text(description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Agency:',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(agencyName,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Launch type:',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(type,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rocket name:',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(rocketName,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rocket variant:',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(rocketVariant,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mission Name:',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(missionName,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Orbit:',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(orbitName,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Launch Location:',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                      Text(location,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date:',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(date_final,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Time:',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(time_final,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
