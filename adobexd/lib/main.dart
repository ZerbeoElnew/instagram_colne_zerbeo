import 'package:adobexd/Screens/AfwraTest.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'Login2.dart';
import 'Signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen()

    );
  }
}
