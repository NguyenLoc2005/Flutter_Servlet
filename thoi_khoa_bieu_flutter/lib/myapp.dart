import 'package:flutter/material.dart';
import 'package:thoi_khoa_bieu_flutter/login-screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thơi khóa biểu',
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
