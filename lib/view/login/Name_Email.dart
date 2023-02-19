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
  final email_controller= TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text('Enter details to continue',
          style: TextStyle(
            fontSize: 30
          ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


            Text('Name'),
            TextFormField(
              controller: name_controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Name"
              ),

            ),
            SizedBox(height: 50,),
            Text('Email'),
            TextFormField(
              controller: email_controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Email"
              ),
            ),
              ],
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHome()));
            // datago();
              FirebaseAuth.instance.currentUser!.updateDisplayName("Siddh");

          },
              child: Text("Submit")
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

