import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // google sign in

  signInWithGoogle() async {

    final int userName;
    final String userEmail;
    final String userPhoto;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    //google sigin screen

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain details from request

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create new credential for user

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    // get profile photo

    // GoogleSignInAccount? user = googleSignIn.currentUser;
    // if (user != null) {
    //   // Display user details
    //   userName=user.displayName;
    //   userEmail=user.email;
    //   userPhoto=user.photoUrl;
    // }

    //sign in
    

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  
}
