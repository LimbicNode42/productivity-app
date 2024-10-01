import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // You can add more parameters like actions, backgroundColor, etc.
  MyCustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Fuck You App"),
      // Additional properties like actions or style can be added here
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Handle settings action
          },
        ),
      ],
    );
  }

  // This is required when implementing PreferredSizeWidget
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}