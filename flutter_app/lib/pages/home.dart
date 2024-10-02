import 'package:flutter/material.dart';

import 'package:flutter_app/shared/app_bar.dart';
import 'package:flutter_app/shared/buttons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Graph title
            Text(
              'Tracking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Space between title and graph
            // Placeholder for the graph
            Container(
              height: 200, // Adjust height based on your needs
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Graph Placeholder',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 40), // Space between graph and text
            
            // Features title
            Text(
              'Features',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Space between title and buttons
            
            // Buttons
            NavButton(title: 'Goals', onPress: () => Navigator.pushNamed(context, '/goals')),
            NavButton(title: 'Alerts', onPress: () => Navigator.pushNamed(context, '/goals')), //TODO: change to right page
            NavButton(title: 'Penalties', onPress: () => Navigator.pushNamed(context, '/goals')), //TODO: change to right page
          ],
        ),
      ),
    );
  }
}