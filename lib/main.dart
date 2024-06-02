import 'package:flutter/material.dart';
import 'package:quiz_app/config/get_it.dart';
import 'package:quiz_app/pages/login.dart';

void main(List<String> args) {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
