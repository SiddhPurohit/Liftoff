import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:space_flight_recorder/view/details/upcoming_details.dart';
import 'package:space_flight_recorder/view/loading.dart';
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
  int index = 0;
  String Name = '';
  String imageSrc = '';
  List<dynamic> launches = [];
  final rocketImages =[];
  bool loading = true;


  int _currentIndex = 0;
  @override
  void initState() {
    super. initState();
    fetchLaunches();
  }
  void fetchLaunches() async {
    final response = await http.get(
      Uri.parse('https://ll.thespacedevs.com/2.2.0/launch/upcoming/')
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];

        launches = results;
        if(launches.isNotEmpty)
        {
          final launchh = launches.elementAt(_currentIndex);
          final Launchname = launchh['name'];
          Name = Launchname.toString();
          final Launchimage = launchh['image'];
          imageSrc = Launchimage.toString();
          for(index=0;index<=9;index++) {
            rocketImages.add(launches[index]['image']);
          }
          setState(() {

          });
        }

    } else {
      print('Failed to fetch launches: ${response.statusCode}');
    }
    loading=false;
  }

  @override
  Widget build(BuildContext context) {
    if(loading){
      return LoadingScreen();
    }
    return Scaffold(
      drawer: const Nav_Drawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Upcoming Launches'),
      ),
      body: SingleChildScrollView(
        child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
          children: [
              GestureDetector(
                onTap: (){ Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => Upcoming_details(index1: _currentIndex,),
                ),
                );
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children:
                  [
                    CarouselSlider(
                    items: rocketImages.map((imageUrl) {
                      return ClipRRect(

                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          color: Colors.black45,
                          colorBlendMode: BlendMode.darken,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 700,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(launches[_currentIndex]["name"],
                            style: const TextStyle(
                                fontSize: 20,

                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(launches[_currentIndex]["net"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                                fontSize: 12,
                                color: Colors.grey
                            ),
                          ),
                        ),
                       Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Row(
                           children: [
                             const Icon(Icons.location_on_outlined,
                             color: Colors.grey,
                               size: 15,
                             ),
                             Expanded(
                               child: Text( launches[_currentIndex]['pad']['location']['name'],
                                 style: const TextStyle(
                                     fontWeight: FontWeight.bold,
                                     letterSpacing: 3,
                                     fontSize: 12,
                                     color: Colors.grey,
                                    overflow: TextOverflow.ellipsis,
                                 ),
                                 maxLines: 2,
                               ),
                             ),
                           ],
                         ),
                       ),
                         const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < rocketImages.length; i++)
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    width: 15,
                                    height: 1.5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: _currentIndex == i ? Colors.white : Colors.grey,
                                    ),
                                  ),
                              ],
                            ),

                            const SizedBox(height: 16),
                            Text(
                              '${_currentIndex + 1}/${rocketImages.length}',
                              style: const TextStyle(fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

          ],
        ),
            ),
      ),

      //     :ListView.builder(
      //   itemCount: launches.length,
      //   itemBuilder: (context, index) {
      //     final launch = launches[index];
      //     final name = launch['name'];
      //     final net = launch['net'];
      //     final location = launch['pad']['location']['name'];
      //     // final mission = launch['mission']['description'];
      //
      //     return GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => Launch_details_upcoming(index1: index,),
      //           ),
      //         );
      //       },
      //       child:
      //       ListTile(
      //         leading: CircleAvatar(
      //
      //             backgroundImage: NetworkImage(launch['image'])),
      //         title: Text(name,
      //         style: TextStyle(
      //           color: Colors.white
      //         ),
      //         ),
      //         subtitle: Text('$location\n$net',
      //         style: TextStyle(
      //           color: Colors.white
      //         ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
      bottomNavigationBar: BottomNavBar(2),
    );
  }
}
