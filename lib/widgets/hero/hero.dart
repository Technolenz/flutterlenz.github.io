import 'package:flutter/material.dart';

import '../../exports.dart';

Container heroContainer(BuildContext context, Function(int) scrollToSection) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: Stack(
      fit: StackFit.expand,
      children: [
        // Animated Gradient Background
        AnimatedGradientBackground(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flutterlenz',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Innovative Solutions in Flutter',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => scrollToSection(1),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  backgroundColor: Colors.orangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text('Explore Our Services'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Custom Animated Gradient Background Widget
class AnimatedGradientBackground extends StatefulWidget {
  @override
  _AnimatedGradientBackgroundState createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation1;
  late Animation<Color?> _colorAnimation2;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);

    // Define the color animations
    _colorAnimation1 = ColorTween(
      begin: Colors.deepPurple,
      end: Colors.purpleAccent,
    ).animate(_controller);

    _colorAnimation2 = ColorTween(
      begin: Colors.indigo,
      end: Colors.blueAccent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _colorAnimation1.value!,
                _colorAnimation2.value!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        );
      },
    );
  }
}
