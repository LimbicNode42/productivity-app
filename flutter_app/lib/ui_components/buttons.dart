import 'package:flutter/material.dart';

// Custom reusable button widget
class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;
  final VoidCallback? onLongPress; // Allow optional long press

  const NavButton({
    required this.title, 
    this.onPress,
    this.onLongPress  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Space between buttons
      child: ElevatedButton(
        onPressed: onPress,
        onLongPress: onLongPress, // Use `onLongPress` if provided
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, // Text color
          backgroundColor: Colors.white, // Background color
          disabledForegroundColor: Colors.grey.shade600, // Text color when disabled
          disabledBackgroundColor: Colors.grey.shade300, // Background color when disabled
          shadowColor: Colors.grey, // Shadow color of the button
          surfaceTintColor: Colors.green, // Surface tint for Material 3 styling
          elevation: 4, // Elevation of the button (shadow)
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Text style
          padding: EdgeInsets.symmetric(vertical: 16.0), // Button padding (height)
          minimumSize: Size(200, 50), // Minimum button size (width, height)
          fixedSize: Size.fromWidth(300), // Fixed width of the button
          side: BorderSide(color: Colors.grey, width: 1), // Border color and width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          alignment: Alignment.center, // Align the text center
          animationDuration: Duration(milliseconds: 200), // Animation duration for state changes
          enableFeedback: true, // Enable feedback (vibration, etc.)
        ),
        child: SizedBox(
          width: double.infinity, // Make button full-width
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}