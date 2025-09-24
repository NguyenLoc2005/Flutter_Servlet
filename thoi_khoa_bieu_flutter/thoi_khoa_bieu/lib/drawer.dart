import 'package:flutter/material.dart';
import 'package:thoi_khoa_bieu/home-screen.dart';
import 'package:thoi_khoa_bieu/login-screen.dart';
import 'package:thoi_khoa_bieu/setting-screen.dart';
import 'package:thoi_khoa_bieu/time-table-screen.dart';

class App_Drawer extends StatelessWidget {
  const App_Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(1),
        children: [
          //Home
          ListTile(
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),

          //Time table
          ListTile(
            title: Text("Time Table"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimeTableScreen()),
              );
            },
          ),

          //Setting
          ListTile(
            title: Text("Setting"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
          ),

          //Log out
          ListTile(
            title: Text("Log out"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginSreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
