import 'package:flutter/material.dart';
import 'package:thoi_khoa_bieu/login-screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            //TextField userName
            TextField(
              decoration: InputDecoration(
                hint: Text("User name"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),

            //TextField password
            TextField(
              decoration: InputDecoration(
                hint: Text("Password"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),

            //TextField confirmPassoword
            TextField(
              decoration: InputDecoration(
                hint: Text("Confirm password"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),

            //Button back Login va Register
            Row(
              //Button back Login
              children: [
                //Button back
                ElevatedButton(onPressed: login, child: Text("Back")),
                //Button Register
                ElevatedButton(onPressed: register, child: Text("Register")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => LoginSreen()),
    );
  }

  void register() {}
}
