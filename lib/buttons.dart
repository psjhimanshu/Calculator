import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Gradient gradient; // Gradient for background
  final Color textColor;

  const MyButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.gradient = const LinearGradient(
      colors: [Color(0xff6bceff), Color(0xff6bafff)], // Default gradient
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    this.textColor = Colors.white, // Default text color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0), // Adjusted padding
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(25), // Rounded rectangle
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(2, 4), // Shadow effect
                ),
              ],
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black45,
                      offset: Offset(1.0, 1.0), // Text shadow effect
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
