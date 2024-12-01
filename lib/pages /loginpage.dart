import 'package:flutter/material.dart';
import 'package:task_master/widgets/loginbutton.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Onboard!",
              style: TextStyle(
                fontSize: 24,
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
              icon: Icons.g_translate,
              label: "Log in with Google",
              backgroundColor: Colors.white,
              onPressed: () {
                // Add your Google login logic here
              },
            ),
            SizedBox(height: 16),
            LoginButton(
              icon: Icons.facebook,
              label: "Log in with Facebook",
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                // Add your Facebook login logic here
              },
            ),
            Spacer(),
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
