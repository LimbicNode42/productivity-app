import 'package:flutter/material.dart';
import 'package:flutter_app/shared/app_bar.dart';

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(),
      body: const Center(
        child: Text(
          "Goals",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
    );
  }
}