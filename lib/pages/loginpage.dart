import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_master/provider/loginprovider.dart';
import 'package:task_master/widgets/loginbutton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome Onboard!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Let’s help to meet on your task",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 40),
            LoginButton(
              onPressed: () async {
                await loginProvider.signInWithGoogle(context);
              },
              backgroundColor: Colors.white,
              icon: Icon(FontAwesomeIcons.google, color: Colors.red),
              label: "Log in with Google",
            ),
            SizedBox(height: 16),
            LoginButton(
              icon: Icon(Icons.facebook, color: Colors.white),
              label: "Log in with Facebook",
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                // Add your Facebook login logic here
              },
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                // Navigate to Sign In screen logic here
              },
              child: Text(
                "Already Have an account? Sign In",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}