import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  final name_controller= TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter your name to continue',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white
          ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            TextFormField(
              style: TextStyle(
                color: Colors.white
              ),
              controller: name_controller,
              cursorColor: Colors.white,
              decoration: InputDecoration(

                border: OutlineInputBorder(),
                hintText: "Name"

              ),

            ),
              ],
            ),
          ),
          ElevatedButton(

              onPressed: ()async{
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => MyHome()));
            // datago();
              await FirebaseAuth.instance.currentUser!.updateDisplayName(name_controller.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHome(),
                ),
              );
          },
              child: Text("Submit"),

          ),
        ],
      ),
    );
  }

  // datago() {
  //   FirebaseAuth.instance.currentUser!
  //       .updateDisplayName(name_controller.text);
  //   // FirebaseFirestore.instance
  //   //     .collection('UserData')
  //   //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //   //     .set({
  //   //   "uid": FirebaseAuth.instance.currentUser!.uid,
  //   //   "name": name_controller.text,
  //   //   "email": email_controller.text,
  //   //   "phoneno":
  //   //   FirebaseAuth.instance.currentUser!.phoneNumber,
  //   //   "jointime": DateTime.now().toString(),
  //   // });

  }

