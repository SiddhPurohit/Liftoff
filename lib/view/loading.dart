import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dot(animation: _animation, delay: 0),
                Dot(animation: _animation, delay: 200),
                Dot(animation: _animation, delay: 400),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
class Dot extends StatefulWidget {
  final Animation<double> animation;
  final int delay;

  Dot({required this.animation, required this.delay});

  @override
  _DotState createState() => _DotState();
}

class _DotState extends State<Dot> {
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _opacityAnimation = Tween(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animation,
        curve: Interval(
          (widget.delay / 1000), // convert delay from milliseconds to seconds
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}
