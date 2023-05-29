part of 'services.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  /*
  * Sign in with google account
  */
  static Future<UserCredential> signInWithGoogle() async {
    Firebase.initializeApp();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await auth.signInWithCredential(credential);
  }

  /*
  * Get firebase UID current user
  */
  static Future<String> getUid() async {
    Firebase.initializeApp();
    return auth.currentUser!.uid;
  }

  /*
  *Get firebase Current user
  */
  static Future<User?> getCurrentUser() async {
    Firebase.initializeApp();
    return auth.currentUser;
  }

  /*
  *Get firebase Current user profile image
  */
  static Future<String> getProfileImage() async {
    Firebase.initializeApp();
    return auth.currentUser!.photoURL!;
  }

  /*
  *Get firebase Current user display name
  */
  static Future<String> getDisplayName() async {
    Firebase.initializeApp();
    return auth.currentUser!.displayName!;
  }

  /*
  * Get firebase Current user email
  */
  static Future<String> getEmail() async {
    Firebase.initializeApp();
    return auth.currentUser!.email!;
  }

  /*
  *Sign out from application
  */
  static Future signOut() async {
    Firebase.initializeApp();
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    return true;
  }
}
