import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Mapss extends StatefulWidget {
  const Mapss({Key? key}) : super(key: key);

  @override
  State<Mapss> createState() => _MapssState();
}

class _MapssState extends State<Mapss> {

  static final CameraPosition _kGooglePlex= CameraPosition(
      target: LatLng(37.3433232323232, -122.232322323232),
    zoom: 14.4747
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
      onMapCreated: (controller){

      }
      ),
    );

  }
}
