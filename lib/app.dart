import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/splash_screen.dart';
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: splashScreen(),
    );
  }
}
