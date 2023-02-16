import 'package:flutter/material.dart';

import '../nav_bar/bottom_nav_bar.dart';

class previous extends StatefulWidget {
  const previous({super.key});

  @override
  State<previous> createState() => _previousState();
}

class _previousState extends State<previous> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Previous"),

      ),
      bottomNavigationBar: BottomNavBar(1),
    );

  }
}
