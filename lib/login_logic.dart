import 'package:google_sign_in/google_sign_in.dart';

class LoginLogic {
  final googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount> logIn() => googleSignIn.signIn();

  Future<GoogleSignInAccount> logOut() => googleSignIn.signOut();
}
