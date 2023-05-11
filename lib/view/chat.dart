import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:space_flight_recorder/nav_bar/Nav_Drawer.dart';
import 'package:space_flight_recorder/nav_bar/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

const String SpaceBotEndpoint = "https://api.openai.com/v1/chat/completions?=";

Future<Map<String, dynamic>> getSpaceBotResponse(String text, String apiKey) async {
  final response = await http.post(
    Uri.parse(SpaceBotEndpoint),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    },
    body: jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [{"role": "user", "content": text}],
      "temperature": 0.7
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print(response.statusCode);
    throw Exception("Failed to get response from SpaceBot API");
  }
}

class SpaceBotPage extends StatefulWidget {
  const SpaceBotPage({Key? key}) : super(key: key);

  @override
  _SpaceBotPageState createState() => _SpaceBotPageState();
}

class _SpaceBotPageState extends State<SpaceBotPage> {
  final _textController = TextEditingController();
  String _responseText = "Example: What is ISRO's mission statement?";

  Future<void> _getSpaceBotResponse() async {
    final apiKey = "YOUR-API-KEY";
    final response = await getSpaceBotResponse("Your name is Spacebot and reply only if the below question is somewhat related to space"+_textController.text, apiKey);
    setState(() {
      _responseText = response["choices"][0]["message"]["content"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const Nav_Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Text("Hi "+FirebaseAuth.instance.currentUser!.displayName.toString()+", how can I help you?",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              // ElevatedButton(
              //   onPressed: _getSpaceBotResponse,
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.white,
              //     onPrimary: Colors.black,//this is for the text present on the button
              //   ),
              //   child: const Text("Ask",
              //   )
              //
              // ),
              SizedBox(height: 30,),
              Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.white)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Text(_responseText,
                      style: const TextStyle(
                        color: Colors.white
                      ),
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 30,),
              SizedBox(height: 60,),
              Container(

                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.white)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white
                          ),
                          controller: _textController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Ask a question...",
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: _getSpaceBotResponse,
                          icon: const Icon(Icons.send,
                          color: Colors.white,
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(3),
    );
  }
}

