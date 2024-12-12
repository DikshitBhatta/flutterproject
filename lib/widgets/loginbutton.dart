import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Widget icon; // Changed from IconData to Widget
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const LoginButton({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    this.textColor = Colors.black,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
      ),
      icon: icon, // Now accepts any widget
      label: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
        ),
      ),
    );
  }
}
