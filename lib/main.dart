import 'package:api_learning/signup_screen.dart';
import 'package:flutter/material.dart';

import 'example_five.dart';
import 'example_four.dart';
import 'example_three.dart';
import 'example_two.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupScreen(),
    );
  }
}

