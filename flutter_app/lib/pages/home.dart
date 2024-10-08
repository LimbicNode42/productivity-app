import 'package:flutter/material.dart';

import 'package:flutter_app/ui_components/app_bar.dart';
import 'package:flutter_app/ui_components/buttons.dart';
import 'package:flutter_app/permissions/barrel.dart';

class HomeScreen extends StatefulWidget {
  // final bool usagePermission;
  // final bool accessibilityPermission;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Show permission dialog only once in initState
    // TODO: going to need to retrigger this if not allowed when accessing data
    // if (!widget.usagePermission) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     showUsageAccessDialog(context);
    //   });
    // }
    // Use addPostFrameCallback to run after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAccessibilityPermission(context);
    });
  }

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
            NavButton(title: 'Goals', onPress: () => Navigator.pushNamed(context, '/goal_categories')),
            NavButton(title: 'Alerts', onPress: () => Navigator.pushNamed(context, '/installed_apps')), //TODO: change to right page
            NavButton(title: 'Penalties', onPress: () => Navigator.pushNamed(context, '/penalties')), //TODO: change to right page
            NavButton(title: 'Test', onPress: () => Navigator.pushNamed(context, '/test')), //TODO: change to right page
          ],
        ),
      ),
    );
  }
}