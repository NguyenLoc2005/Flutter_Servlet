import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thoi_khoa_bieu_flutter/home-screen.dart';
import 'package:thoi_khoa_bieu_flutter/register-screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon O
                  const Icon(
                    Icons.circle_outlined,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "AppName",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // TextField tài khoản
                  TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'Tài khoản',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TextField mật khẩu
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Mật khẩu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Text hiển thị message
                  if (message.isNotEmpty)
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: message == "Đăng nhập thành công"
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  const SizedBox(height: 25),

                  // Button đăng nhập
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: login,
                      icon: const Icon(Icons.login),
                      label: const Text("Đăng nhập"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Button đăng ký
                  TextButton(
                    onPressed: register,
                    child: const Text(
                      "Tôi chưa có tài khoản",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    final userName = userNameController.text.trim();
    final password = passwordController.text.trim();

    if (userName.isEmpty || password.isEmpty) {
      setState(() => message = "Nhập vào tài khoản, mật khẩu");
      return;
    }

    try {
      final url = Uri.parse(
        "http://10.0.2.2:8080/thoi_khoa_bieu_servlet/Login",
      );
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"userName": userName, "password": password},
      );

      final result = response.body;

      if (result.contains("thành công")) {
        setState(() => message = "Đăng nhập thành công");

        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        });
      } else {
        setState(() => message = result);
      }
    } catch (e) {
      setState(() => message = "Lỗi kết nối: $e");
    }
  }

  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }
}
