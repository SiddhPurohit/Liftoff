import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService
{
  Future<List<Welcome>?> getPosts() async
  {
    var client = http.Client();
    var uri = Uri.parse('GET https://api.spacexdata.com/v5/launches/latest');
    var response = await client.get(uri);
    if(response.statusCode == 200)
      {
        var jsonString = response.body;
        final welcome = welcomeFromJson(jsonString);
      }
  }
}