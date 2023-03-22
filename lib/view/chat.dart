import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:space_flight_recorder/nav_bar/Nav_Drawer.dart';
import 'package:space_flight_recorder/nav_bar/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

const String chatGptEndpoint = "https://api.openai.com/v1/chat/completions?=";

Future<Map<String, dynamic>> getChatGptResponse(String text, String apiKey) async {
  final response = await http.post(
    Uri.parse(chatGptEndpoint),
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
    throw Exception("Failed to get response from ChatGPT API");
  }
}

class ChatGptPage extends StatefulWidget {
  const ChatGptPage({Key? key}) : super(key: key);

  @override
  _ChatGptPageState createState() => _ChatGptPageState();
}

class _ChatGptPageState extends State<ChatGptPage> {
  final _textController = TextEditingController();
  String _responseText = "";

  Future<void> _getChatGptResponse() async {
    final apiKey = "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";
    final response = await getChatGptResponse(_textController.text, apiKey);
    setState(() {
      _responseText = response["choices"][0]["message"]["content"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      drawer: const Nav_Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Ask anything",

        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: "Ask a question...",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _getChatGptResponse,
                child: const Text("Ask"),
              ),
              const SizedBox(height: 16),
              Container(
                width: 350,
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
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
              const SizedBox(height: 30,),
              InkWell(
                child: const Text("Powered by ChatGPT API",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  decoration: TextDecoration.underline
                ),

                ),
                onTap: ()
                {
                  launchUrlString('https://platform.openai.com/',
                      mode: LaunchMode.externalApplication
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(3),
    );
  }
}

