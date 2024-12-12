import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_master/pages/loginpage.dart';
import 'package:task_master/services/database.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Get Current User
  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser;
    } catch (e) {
      debugPrint("Error getting current user: $e");
      return null;
    }
  }

  // Sign in with Google
  Future<bool> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger Google Sign-In
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // User canceled the Google Sign-In
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Google Sign-In canceled.")),
        );
        return false;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;

      // Create credentials
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Authenticate with Firebase
      final UserCredential result = await _auth.signInWithCredential(credential);
      final User? userDetails = result.user;

      if (userDetails != null) {
        // Save user information in Firestore
        final Map<String, dynamic> userInfoMap = {
          "email": userDetails.email,
          "name": userDetails.displayName,
          "imgUrl": userDetails.photoURL,
          "id": userDetails.uid,
        };

        await DatabaseMethods().addUser(userDetails.uid, userInfoMap);

        // Navigate to Dashboard
        Navigator.pushReplacementNamed(context, '/dashboard');
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to retrieve user details.")),
        );
        return false;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Authentication error: ${e.message}")),
      );
      return false;
    } catch (e) {
      debugPrint("Error during Google Sign-In: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
      return false;
    }
  }

  // Sign Out
  Future<void> signOut(BuildContext context) async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } catch (e) {
      debugPrint("Error signing out: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error signing out: $e")),
      );
    }
  }
}
