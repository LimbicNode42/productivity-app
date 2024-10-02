import 'package:flutter/material.dart';
// TODO: replace shared_prefences usage here with hive/isar
// will still use shared_preference for user settings (preferences. duh)
// use provider/riverpod for non-persisted state
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:flutter_app/shared/app_bar.dart';
import 'package:flutter_app/shared/buttons.dart';

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  List<String> _goals = []; // List to store button titles
  final String _key = 'saved_goals';
  bool _isLoading = true; // Track whether goals are still loading

  @override
  void initState() {
    super.initState();
    _loadGoals(); // Load saved goals when the app starts
  }

  // Load goals from shared preferences
  void _loadGoals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? goalsString = prefs.getString(_key);
    if (goalsString != null) {
      List<String> savedGoals = List<String>.from(jsonDecode(goalsString));
      setState(() {
        _goals = savedGoals;
      });
    }
    setState(() {
      _isLoading = false; // Set loading to false when done
    });
  }

  // Save goals to shared preferences
  void _saveGoals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(_goals));
  }

  // Add a new goal to the list and save it
  void _addGoal(String name) {
    setState(() {
      _goals.add(name);
    });
    _saveGoals();
  }

  // Delete a goal from the list
  void _deleteGoal(int index) {
    setState(() {
      _goals.removeAt(index);
    });
    _saveGoals();
  }

  void _updateGoal(int index, String newTitle) {
    setState(() {
      _goals[index] = newTitle; // Update the title of the goal at the specified index
    });
  }

  void _showOptionsDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Options'),
          content: Text('What would you like to do with "${_goals[index]}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancel the dialog
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the options dialog
                _showEditDialog(index); // Open the edit dialog
              },
              child: Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the options dialog
                _showDeleteConfirmation(index);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Show confirmation dialog to delete a goal
  void _showDeleteConfirmation(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Goal'),
          content: Text('Are you sure you want to delete this goal?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancel deletion
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteGoal(index); // Confirm deletion
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(int index) {
    TextEditingController editController = TextEditingController(text: _goals[index]); // Pre-fill with current title

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Goal'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: 'Enter new goal title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancel without editing
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String updatedTitle = editController.text.trim();
                if (updatedTitle.isNotEmpty) {
                  _updateGoal(index, updatedTitle); // Update goal title
                }
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showAddTitleDialog() {
    TextEditingController titleController = TextEditingController(); // Controller for the input field

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Goal Title'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter goal title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancel without saving
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the new button with the entered title
                String newTitle = titleController.text.trim();
                if (newTitle.isNotEmpty) {
                  _addGoal(newTitle); // Function to handle the addition of the new goal
                }
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // Show loading indicator while loading
            : _goals.isEmpty
              ? Text(
                  'Click the + to add a goal',
                  style: TextStyle(fontSize: 18),
                )
              : ListView.builder(
                  itemCount: _goals.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NavButton(
                        title: _goals[index],
                        onPress: () => Navigator.pushNamed(context, '/home'),
                        onLongPress: () => _showOptionsDialog(index), // Trigger the dialog
                      )
                    );
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTitleDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}