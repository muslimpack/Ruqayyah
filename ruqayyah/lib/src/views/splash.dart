import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ruqayyah/src/features/home/presentation/screens/dashboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const DashboardScreen();
          },
        ),
      );
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          scale: 3,
        ),
      ),
    );
  }
}
