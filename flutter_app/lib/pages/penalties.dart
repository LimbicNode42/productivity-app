import 'package:flutter/material.dart';

import 'package:flutter_app/ui_components/app_bar.dart';
import 'package:flutter_app/ui_components/buttons.dart';

class PenaltiesScreen extends StatefulWidget {
  const PenaltiesScreen({Key? key}) : super(key: key);

  _PenaltiesScreenState createState() => _PenaltiesScreenState();
}

class _PenaltiesScreenState extends State<PenaltiesScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyCustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Features title
                  Text(
                    'Penalties',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Space between title and buttons
                  
                  // Buttons
                  NavButton(title: 'Blocked Apps', onPress: () => Navigator.pushNamed(context, '/blocked_apps')),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}