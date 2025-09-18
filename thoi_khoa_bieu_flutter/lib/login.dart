import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thoi_khoa_bieu_flutter/home-screen.dart';
import 'package:thoi_khoa_bieu_flutter/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = ""; // Thông báo tình trạng login

  void login() async {
    final String userName = userNameController.text.trim();
    final String password = passwordController.text.trim();

    if (userName.isEmpty || password.isEmpty) {
      setState(() {
        message = "Nhập vào tài khoản, mật khẩu";
      });
      return;
    }

    try {
      var url = Uri.parse("http://10.0.2.2:8080/thoi_khoa_bieu_servlet/Login");

      // Gửi form-data thay vì JSON
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"userName": userName, "password": password},
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == "success") {
        setState(() {
          message = "Đăng nhập thành công";
        });

        // Chuyển màn hình sau 1 giây
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        });
      } else {
        setState(() {
          message = data['message'] ?? "Sai tài khoản hoặc mật khẩu";
        });
      }
    } catch (e) {
      setState(() {
        message = "Lỗi kết nối: $e";
      });
    }
  }

  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Thời khóa biểu'))),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField tài khoản
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: 'Tài khoản',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // TextField mật khẩu
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Text hiển thị message
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: message == "Đăng nhập thành công"
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            SizedBox(height: 20),

            // Row chứa 2 nút
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: login, child: Text("Đăng nhập")),
                ElevatedButton(
                  onPressed: register,
                  child: Text("Tôi chưa có tài khoản"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
