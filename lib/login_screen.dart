import 'package:flutter/material.dart';
import 'package:google_sign_in_demo/login_logic.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Login with Google'),
          onPressed: () {
            loginUser(context);
          },
        ),
      ),
    );
  }

  Future loginUser(context) async {
    final userInfo = await LoginLogic().logIn();

    if (userInfo == null) {
      print('Login Failed');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            googleSignInAccount: userInfo,
          ),
        ),
      );
    }
  }
}
