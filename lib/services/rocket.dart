// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
//
// import '../services/launch.dart';
//
//
// class LaunchService {
//
//   Future<Launch> fetchLaunch() async {
//     var response = await http.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/event/upcoming/?limit=10&offset=1'));
//
//     var json = convert.jsonDecode(response.body);
//
//     var launch = Launch.fromJson(json[1]);
//
//     return launch;
//   }
//
// }
import 'package:http/http.dart' as http;
import 'package:space_flight_recorder/models/post.dart';
import 'dart:convert' as convert;

import 'package:space_flight_recorder/services/launch.dart';


class LaunchService {

  Future<Post?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://ll.thespacedevs.com/2.2.0/launch/upcoming/?limit=10');
    var response = await client.get(uri);
    if(response.statusCode == 200 )
      {
        var json = response.body;
        return postFromJson(json);
      }


  }
}