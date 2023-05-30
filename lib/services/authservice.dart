part of 'services.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String? username;

  static Future<UserCredential> signInWithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await auth.signInWithCredential(credential);

    username = userCredential.user!.displayName;

    return userCredential;
  }

  static Future<bool> signOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
    username = null;
    return true;
  }
}
