import 'package:flutter/material.dart';
import 'package:tugas1/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageInput createState() => _LoginPageInput();
}

class _LoginPageInput extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _errormsg;

  void checkLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    setState(() {
      _errormsg = null;
    });

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errormsg = "Username dan Password harus diisi";
      });
      _clearErrormsg();
      return;
    } else if (username == "admin" && password == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      setState(() {
        _errormsg = "Username atau Password salah";
      });
      _clearErrormsg();
    }
  }

  void _clearErrormsg() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _errormsg = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF7CFD8), Color(0xFFA6F1E0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/image/maths.png", width: 100, height: 100),
                  SizedBox(height: 20),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF4F8D3),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Color(0xFF4A4A4A)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF73C7C7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF4F8D3),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Color(0xFF4A4A4A)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF73C7C7)),
                      ),
                    ),
                  ),
                  if (_errormsg != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          _errormsg!,
                          style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF73C7C7),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xFFA6F1E0)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                    ),
                    onPressed: checkLogin,
                    child: Text(
                      "Login",
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
}

