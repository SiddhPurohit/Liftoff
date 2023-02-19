import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Text('Go Space!!',
              style: TextStyle(
                  color: Colors.white
              ),),
          ),
          ListTile(
            leading: Icon(
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
