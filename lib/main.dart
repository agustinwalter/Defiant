import 'package:defiant/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Defiant());

class Defiant extends StatelessWidget {
  const Defiant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Defiant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}
