import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_flight_recorder/view/main_page.dart';

class RocketAnimation extends StatefulWidget {

  @override
  _RocketAnimationState createState() => _RocketAnimationState();
}

class _RocketAnimationState extends State<RocketAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Create a Tween animation from 0.0 to 1.0
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Start the animation
    _animationController.forward().whenComplete(() {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (context) => const main_page(),
          ),
        );
      });
    });

    // Listen for animation status changes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {}); // Rebuild the widget when the animation completes
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: screenHeight - 150,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -screenHeight * _animation.value),
                  child: Image.asset(
                    'assets/images/splash_rocket.png',
                    height: 50,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          if (_animation.value == 1.0) // Only show the text when the animation completes
            const Center(
              child: Text(
                'Liftoff',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}