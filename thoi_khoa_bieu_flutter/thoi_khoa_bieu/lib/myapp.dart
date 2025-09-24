import 'package:flutter/material.dart';
import 'package:thoi_khoa_bieu/home-screen.dart';
import 'package:thoi_khoa_bieu/login-screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(title: "Time Table", home: HomeScreen());
  }
}
