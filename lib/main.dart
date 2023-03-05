import 'package:ai/presention/screens/LogIn.dart';
import 'package:ai/presention/screens/Registerion.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SmartBarking());
}

class SmartBarking extends StatelessWidget {
  const SmartBarking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LogIn(),
    );
  }
}
