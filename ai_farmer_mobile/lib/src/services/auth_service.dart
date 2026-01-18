import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      if (googleUser == null) {
        // User canceled the sign-in
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final userCredential = await _auth.signInWithCredential(credential);
      
      // Save user data to SharedPreferences
      if (userCredential.user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', userCredential.user!.displayName ?? 'Farmer');
        await prefs.setString('userEmail', userCredential.user!.email ?? '');
        await prefs.setString('userId', userCredential.user!.uid);
        await prefs.setString('loginDate', DateTime.now().toIso8601String());
        await prefs.setString('loginMethod', 'google');
      }

      return userCredential;
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }

  // Sign in with email and password (for future use)
  Future<UserCredential?> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (userCredential.user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', userCredential.user!.displayName ?? email.split('@')[0]);
        await prefs.setString('userEmail', userCredential.user!.email ?? '');
        await prefs.setString('userId', userCredential.user!.uid);
        await prefs.setString('loginDate', DateTime.now().toIso8601String());
        await prefs.setString('loginMethod', 'email');
      }
      
      return userCredential;
    } catch (e) {
      throw Exception('Email Sign-In failed: $e');
    }
  }

  // Simple login (without Firebase)
  Future<void> simpleLogin(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);
    await prefs.setString('loginDate', DateTime.now().toIso8601String());
    await prefs.setString('loginMethod', 'simple');
  }

  // Sign out
  Future<void> signOut() async {
    try {
      // Sign out from Google if signed in with Google
      final prefs = await SharedPreferences.getInstance();
      final loginMethod = prefs.getString('loginMethod');
      
      if (loginMethod == 'google') {
        await _googleSignIn.signOut();
      }
      
      // Sign out from Firebase
      await _auth.signOut();
      
      // Clear SharedPreferences
      await prefs.clear();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString('userName');
    return userName != null && userName.isNotEmpty;
  }

  // Get user data
  Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'userName': prefs.getString('userName'),
      'userEmail': prefs.getString('userEmail'),
      'userId': prefs.getString('userId'),
      'loginMethod': prefs.getString('loginMethod'),
    };
  }
}
