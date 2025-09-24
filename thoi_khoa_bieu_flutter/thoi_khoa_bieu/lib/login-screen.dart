import 'package:flutter/material.dart';
import 'package:thoi_khoa_bieu/register-screen.dart';

class LoginSreen extends StatefulWidget {
  const LoginSreen({super.key});

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //TextField userName
            TextField(
              decoration: InputDecoration(
                hint: Text("User Name"),
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

            //Button Login and Button I dont have account
            Row(
              children: [
                //Button Login
                ElevatedButton(onPressed: login, child: Text("Login")),
                //Button I dont have account
                ElevatedButton(
                  onPressed: register,
                  child: Text("I dont have account"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login() {}

  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }
}
