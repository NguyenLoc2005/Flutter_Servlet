import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thoi_khoa_bieu_flutter/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String message = ""; // Thông báo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Đăng ký tài khoản"))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tài khoản
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                hintText: 'Nhập tài khoản',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Mật khẩu
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Nhập mật khẩu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Nhập lại mật khẩu
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Nhập lại mật khẩu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(onPressed: register, child: const Text("Đăng ký")),
            const SizedBox(height: 20),

            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: message == "Đăng ký thành công"
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void register() async {
    final userName = userNameController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (userName.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() => message = "Vui lòng điền đầy đủ thông tin");
      return;
    }

    if (password != confirmPassword) {
      setState(() => message = "Mật khẩu nhập lại không khớp");
      return;
    }

    try {
      final url = Uri.parse(
        "http://10.0.2.2:8080/thoi_khoa_bieu_servlet/Register",
      );

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          "userName": userName,
          "password1": password,
          "password2": confirmPassword,
        },
      );

      final result = response.body; // plain text từ backend
      setState(() => message = result);

      if (result == "Đăng ký thành công") {
        // Chuyển sang Login sau 1 giây
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const Login()),
          );
        });
      }
    } catch (e) {
      setState(() => message = "Lỗi kết nối: $e");
    }
  }
}
