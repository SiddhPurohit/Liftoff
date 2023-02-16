import 'package:flutter/material.dart';

import '../nav_bar/bottom_nav_bar.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _nameState();
}

class _nameState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("About"),
      ),
      bottomNavigationBar: BottomNavBar(3),
    );
  }
}
