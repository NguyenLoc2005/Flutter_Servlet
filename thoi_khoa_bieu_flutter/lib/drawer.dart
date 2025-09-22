import 'package:flutter/material.dart';
import 'package:thoi_khoa_bieu_flutter/home-screen.dart';
import 'package:thoi_khoa_bieu_flutter/login-screen.dart';
import 'package:thoi_khoa_bieu_flutter/thoi-khoa-bieu-screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 50),

          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context); // Đóng drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),

          ListTile(
            title: const Text("Thời khóa biểu"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThoiKhoaBieuScreen(),
                ),
              );
            },
          ),

          ListTile(
            title: const Text("Đăng xuất"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
