import 'package:flutter/material.dart';
import 'package:thoi_khoa_bieu/drawer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      drawer: App_Drawer(),
      body: Center(child: Text("Setting")),
    );
  }
}
