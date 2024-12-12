import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_master/services/auth.dart';

class LoginProvider with ChangeNotifier {
  final AuthMethods _authMethods = AuthMethods();
  User? _user;

  LoginProvider() {
    getCurrentUser();
  }

  User? get user => _user;

  Future<void> signInWithGoogle(BuildContext context) async {
    bool success = await _authMethods.signInWithGoogle(context);
    if (success) {
      _user = FirebaseAuth.instance.currentUser;
      debugPrint("User signed in: ${_user?.displayName}");
      notifyListeners();
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _authMethods.signOut(context);
    _user = null;
    debugPrint("User signed out");
    notifyListeners();
  }

  Future<void> getCurrentUser() async {
    _user = await _authMethods.getCurrentUser();
    debugPrint("Current user: ${_user?.displayName}");
    notifyListeners();
  }
}
