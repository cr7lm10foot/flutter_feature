import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Animated Button Example')),
        body: Center(child: AnimatedButton()),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isTapped = false;

  void _toggleAnimation() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleAnimation,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Duration of animation
        curve: Curves.easeInOut, // Animation curve
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          color: _isTapped ? Colors.blue : Colors.orange, // Color change
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: _isTapped ? 10 : 0, // Elevation change
              spreadRadius: 1,
            ),
          ],
        ),
        child: Text(
          'Tap Me!',
          style: TextStyle(
            color: Colors.white,
            fontSize: _isTapped ? 24 : 20, // Font size change
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
