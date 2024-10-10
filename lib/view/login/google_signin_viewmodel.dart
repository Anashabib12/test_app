import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninViewmodel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  var isLoggedIn = false.obs;
  var user = Rx<User?>(null); // Use Rx<User?> to allow null

  Future<User?> googleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        user.value = userCredential.user;
        isLoggedIn.value = true;
        return userCredential.user;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in with Google');
      return null;
    }
    // return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    isLoggedIn.value = false;
    user.value = null;
  }
}
