import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    final String userName = userNameController.text;
    final String password = passwordController.text;

    if (userName.isEmpty || password.isEmpty) {
      setState(() {
        message = "Nhập vào tài khoản, mật khẩu";
      });
      return;
    }

    try {
      var url = Uri.parse("http://10.0.2.2:8080/thoi_khoa_bieu_servlet/Login");
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"userName": userName, "password": password}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          if (data['status'] == "success") {
            message = "Đăng nhập thành công";
          } else {
            message = "Sai tài khoản hoặc mật khẩu";
          }
        });
      } else {
        setState(() {
          message = "Lỗi server: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        message = "Lỗi kết nối $e";
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
