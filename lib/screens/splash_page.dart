import 'package:flutter/material.dart';
import 'dart:async';
import 'homepage.dart'; // Ensure correct path

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HotelEase',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
          accentColor: Color(0xFF5B3A29), // Custom accent color
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Duration of the scaling effect
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward(); // Start the scaling animation

    // Navigate to HomePage after splash duration
    Timer(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => HomePage()), // Ensure correct navigation
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5B3A29), Color(0xFF3E2A1F)], // Subtle gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: ClipOval(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 15.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Image.asset('assets/logo.jpg',
                  height: 120, width: 120, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
