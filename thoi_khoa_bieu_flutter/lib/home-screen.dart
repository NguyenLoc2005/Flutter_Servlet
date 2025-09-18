import 'package:flutter/material.dart';
import 'package:thoi_khoa_bieu_flutter/drawer.dart';

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
      drawer: const AppDrawer(),
      body: Center(child: Text("Chỗ này để thông báo")),
    );
  }
}
