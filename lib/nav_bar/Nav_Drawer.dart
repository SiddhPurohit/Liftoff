import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:space_flight_recorder/view/about.dart';
import 'package:space_flight_recorder/view/login/Name_Email.dart';

import '../view/login/phone.dart';

class Nav_Drawer extends StatefulWidget {
  const Nav_Drawer({Key? key}) : super(key: key);

  @override
  State<Nav_Drawer> createState() => _Nav_DrawerState();
}

class _Nav_DrawerState extends State<Nav_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white70,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/images/launch_icon.png',
                    width: 70,
                    height: 70,

                  ),
                ),
                SizedBox(height: 20,),
                const Text("Liftoff",
                  style: TextStyle(
                    fontSize: 20,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(
              color: Colors.white,
              Icons.edit,
            ),
            title: const Text('Edit Name',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Details()),
              );
            },
          ),

          ListTile(
            leading: const Icon(
              color: Colors.white,
              Icons.logout,
            ),
            title: const Text('Log Out',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyPhone()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              color: Colors.white,
              Icons.info,
            ),
            title: const Text('About',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const about()),
              );
            },
          ),

          // ListTile(
          //   leading: Icon(
          //     Icons.train,
          //   ),
          //   title: const Text('Page 2',
          //   style: TextStyle(
          //   color:Colors.white
          //   )
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
