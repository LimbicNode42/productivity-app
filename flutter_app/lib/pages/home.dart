import 'package:flutter/material.dart';
import 'package:flutter_app/shared/app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(),
      body: const Center(
        child: Text(
          "Home",
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
          Navigator.pushNamed(context, '/goals');
        },
      ),
    );
  }
}