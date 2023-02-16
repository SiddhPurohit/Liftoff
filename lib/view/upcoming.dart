import 'package:flutter/material.dart';

import '../nav_bar/bottom_nav_bar.dart';

class upcoming extends StatefulWidget {
  const upcoming({super.key});

  @override
  State<upcoming> createState() => _nameState();
}

class _nameState extends State<upcoming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Upcoming"),
      ),
      bottomNavigationBar: BottomNavBar(2),
    );
  }
}
