import 'package:flutter/material.dart';

// Function to create a fade transition route
Route fadeTransition(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Define the transition as a fade
      const begin = 0.0;
      const end = 1.0;
      final tween = Tween(begin: begin, end: end);
      final fadeAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    },
  );
}