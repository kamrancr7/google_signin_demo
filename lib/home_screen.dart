import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_demo/login_logic.dart';
import 'package:google_sign_in_demo/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final GoogleSignInAccount googleSignInAccount;

  HomeScreen({this.googleSignInAccount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(googleSignInAccount.photoUrl),
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                googleSignInAccount.displayName,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                googleSignInAccount.email,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  logOutUser(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future logOutUser(context) async {
    await LoginLogic().logOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
