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
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/image/maths.png", width: 100, height: 100),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(label: Text("Username")),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: false,
                  decoration: InputDecoration(label: Text("Password")),
                ),
                if (_errormsg != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        _errormsg!,
                        style: TextStyle(color: Colors.red, fontSize: 13),
                      ),
                    ),
                  ),
                ElevatedButton(onPressed: checkLogin, child: Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
