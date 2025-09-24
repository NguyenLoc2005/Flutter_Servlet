import 'package:flutter/material.dart';
import 'package:thoi_khoa_bieu/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: App_Drawer(),
      body: Center(child: Text("there are notifications")),
    );
  }
}
