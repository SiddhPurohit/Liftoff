import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:space_flight_recorder/services/remote_services.dart';

import 'models/post.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Welcome>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }
  getData() async{
    posts = await RemoteService().getPosts();
    if(posts !=null)
      {
        setState(() {
          isLoaded=true;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body:
          // TextButton(
          //     onPressed: () async{
          //   await FirebaseAuth.instance.signOut();
          //   Navigator.pushNamed(context, 'phone');
          // },
          //     child: Text("Logout")),
          Visibility(
            visible: isLoaded,
            child: ListView.builder(
              itemCount: posts?.length,
                itemBuilder: (context, index){
                  return Container(
                    child: Text(posts![index].rocket),
                  );
                }


      ),
            replacement: Center(child:CircularProgressIndicator()),
          ),

    );

  }

}
