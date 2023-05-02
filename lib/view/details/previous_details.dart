import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:space_flight_recorder/view/loading.dart';
import 'package:space_flight_recorder/view/login/Name_Email.dart';

class Previous_details extends StatefulWidget {
  final int index1;
  Previous_details({required this.index1});
  @override
  _Previous_detailsState createState() => _Previous_detailsState();
}

class _Previous_detailsState extends State<Previous_details> {
  DateTime launchTime = DateTime.now();
  String Name = '';
  String description = '';
  String agencyName = '';
  String type = '';
  String rocketName = '';
  String rocketVariant = '';
  String missionName = '';
  String orbitName = '';
  String location = '';
  String time = '';
  String date = '';
  bool loading = true;
  String? error;
  String lati = "";
  String long = "";
  String imgSrc="";
  String missionType="";
  String padName="";
  String programDescription = "";
  String m_status='';
  String time1='';
  String localTime='';
  BitmapDescriptor? myIcon;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    fetchPrevious_details(widget.index1);
    Timer.periodic(const Duration(seconds: 1), (Timer t) => updateCountdown());
    if (FirebaseAuth.instance.currentUser!.displayName == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Details()));
    }
    // _loadIcon();
  }

  // void _loadIcon() async {
  //   final ui.Image image = await loadImageFromAsset('assets/images/my_marker.png', width: 50, height: 50);
  //   final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   myIcon = BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  // }
  //
  //
  // Future<ui.Image> loadImageFromAsset(String assetName, {int width = 100, int height = 100}) async {
  //   final ByteData data = await rootBundle.load(assetName);
  //   final Completer<ui.Image> completer = Completer();
  //   ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) async {
  //     final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  //     final ui.FrameInfo fi = await codec.getNextFrame();
  //     final double devicePixelRatio = ui.window.devicePixelRatio;
  //     final ui.Image resized = await ui.webOnlyInstantiateImageCodec(data.buffer.asUint8List()).then((ui.Image image) async {
  //       final ui.Canvas canvas = ui.Canvas.ui(ui.window.physicalSize.width, ui.window.physicalSize.height, ui.window.devicePixelRatio);
  //       final ui.Rect rect = ui.Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble());
  //       canvas.drawImage(image, rect, rect, ui.Paint());
  //       return await canvas.toImage(width, height).then((value) => value);
  //     });
  //     completer.complete(resized);
  //   });
  //   return completer.future;
  // }
  //



  // void _loadIcon() async {
  //   myIcon = await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(devicePixelRatio: 2.5),
  //     'assets/images/my_marker.png',
  //   );
  // }
  void fetchPrevious_details(index) async {
    final response = await http.get(
        Uri.parse('https://ll.thespacedevs.com/2.2.0/launch/previous/?limit=110'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      if (results.isNotEmpty) {
        final launch = results.elementAt(index);
        final launchTimeStr = launch['net'];
        launchTime = DateTime.parse(launchTimeStr).toLocal();
        time1 = launchTime.toString();
        final Launchname = launch['name'];
        Name = Launchname.toString();
        final descp = launch['mission']['description'];
        description = descp;
        final agenName = launch['launch_service_provider']['name'];
        agencyName = agenName;
        if(launch['launch_service_provider']['type']==null){
          type="";
        }
        else{
          final typee = launch['launch_service_provider']['type'];
          type=typee;
        }
        final r_name = launch['rocket']['configuration']['name'];
        rocketName = r_name;
        final r_variant = launch['rocket']['configuration']['variant'];
        rocketVariant = r_variant;
        final m_name = launch['mission']['name'];
        missionName = m_name;
        final orbit_name = launch['mission']['orbit']['name'];
        orbitName = orbit_name;
        final pad_location = launch['pad']['location']['name'];
        location = pad_location;
        final estimated_time = launch['net'];
        time = estimated_time;
        final latitude = launch['pad']['latitude'];
        lati = latitude;
        final longitude = launch['pad']['longitude'];
        long = longitude;
        final image = launch['image'];
        imgSrc = image;
        final m_type = launch['mission']['type'];
        missionType = m_type;
        final pad_name = launch['pad']['name'];
        padName = pad_name;
        final status = launch['status']['name'];
        m_status = status;

        // final p_description = launch['program']['description'];
        // programDescription = p_description;

      } else {
        print('No upcoming launches found');
      }
    } else {
      error = 'Failed to fetch upcoming launches';
      print('Failed to fetch upcoming launches: ${response.statusCode}');
    }
    loading = false;
  }

  void updateCountdown() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // double lati1 =double.parse(lati);
    // double long1 =double.parse(long);
    if (loading) {
      return LoadingScreen();
    }

    final now = DateTime.now().toLocal();
    final duration = launchTime.difference(now);
    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    final final_time = time1.split(" ");
    final date_final = final_time.elementAt(0).toString();
    final time_final = final_time.elementAt(1).toString();
    final time11 = time_final.split(".");
    localTime = time11.elementAt(0).toString();
    String? userName = FirebaseAuth.instance.currentUser?.displayName;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Previous"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Launched at',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4),BlendMode.srcOver),

                                  fit: BoxFit.cover,
                                  image: NetworkImage(imgSrc,

                                  )
                              )
                          ),
                          height: 350,
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
                                  const Text(
                                    'Days : Hours : Minutes : Seconds',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),

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
                              Text(rocketName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(missionType,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "AGENCY",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(imgSrc,
                              ),
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      agencyName,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      padName,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10,),
                              const Text(
                                "DESCRIPTION",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                description+programDescription,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "MORE INFORMATION",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: const Color.fromRGBO(27, 28, 33, 1)),
                                        height: 80,
                                        width: 200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('NAME', style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12
                                              ),),
                                              const SizedBox(height: 2,),
                                              Text( Name,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15
                                                ),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        )),

                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: const Color.fromRGBO(27, 28, 33, 1)),
                                      height: 80,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text('MISSION NAME', style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12
                                            ),
                                              maxLines: 2,
                                            ),
                                            const SizedBox(height: 2,),
                                            Text( missionName,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15
                                              ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: const Color.fromRGBO(27, 28, 33, 1)),
                                      height: 80,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text('STATUS', style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12
                                            ),
                                              maxLines: 2,
                                            ),
                                            const SizedBox(height: 2,),
                                            Text( m_status,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15
                                              ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.map,
                                          color: Colors.white,
                                          size: 45,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            location,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('LOCATION',
                                            style: TextStyle(
                                                color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.circle_outlined,
                                          color: Colors.white,
                                          size: 45,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            orbitName,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('ORBIT',
                                            style: TextStyle(
                                                color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.access_time_filled,
                                          color: Colors.white,
                                          size: 45,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            localTime,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('Time of launch',
                                            style: TextStyle(
                                                color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.date_range,
                                          color: Colors.white,
                                          size: 45,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            date_final,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('Date of launch',
                                            style: TextStyle(
                                                color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                        const Text(
                          "Location",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 5),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    height: 300,
                    child: GoogleMap(

                      markers: {
                        Marker(
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueAzure
                          ),
                          markerId: const MarkerId("Launch Location"),
                          position: LatLng(double.parse(lati), double.parse(long)),
                          draggable: true,
                          onDragEnd: (value) {
                            // value is the new position
                          },
                        ),
                      },
                      gestureRecognizers: Set()
                        ..add(Factory<OneSequenceGestureRecognizer>(
                                () => EagerGestureRecognizer()))
                        ..add(Factory<PanGestureRecognizer>(
                                () => PanGestureRecognizer()))
                        ..add(Factory<ScaleGestureRecognizer>(
                                () => ScaleGestureRecognizer()))
                        ..add(Factory<TapGestureRecognizer>(
                                () => TapGestureRecognizer()))
                        ..add(Factory<VerticalDragGestureRecognizer>(
                                () => VerticalDragGestureRecognizer())),
                      initialCameraPosition: CameraPosition(
                          target: LatLng(double.parse(lati), double.parse(long)),
                          zoom: 14),
                      onMapCreated: (controller) async{

                        String style = await DefaultAssetBundle.of(context)
                            .loadString('assets/map_style.json');
                        controller.setMapStyle(style);
                      },
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ),
          //

        ],
      ),
    );


  }
}
