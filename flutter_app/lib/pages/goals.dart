import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/models/goals.dart';
import 'package:flutter_app/state_managers/goals.dart';
import 'package:flutter_app/ui_components/app_bar.dart';
import 'package:flutter_app/ui_components/buttons.dart';

class GoalsPage extends ConsumerStatefulWidget {
  final int categoryId;

  const GoalsPage({Key? key, required this.categoryId});

  @override
  ConsumerState<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends ConsumerState<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    final goalNotifier = ref.watch(goalNotifierProvider(widget.categoryId).notifier); // Watch notifier for loading state
    final goals = ref.watch(goalNotifierProvider(widget.categoryId)); // Watch goals list
    
    return Scaffold(
      appBar: MyCustomAppBar(),
      body: goalNotifier.isLoading ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : goals.isEmpty ? Center(child: Text('Click the + to add a goal'))
          : ListView.builder(
            itemCount: goals.length,
            itemBuilder: (context, index) {
              final goal = goals[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NavButton(
                  title: goal.title,
                  onPress: () => Navigator.pushNamed(context, '/tasks', arguments: {'goalId': goal.id}),
                  onLongPress: () => _showGoalOptionsDialog(context, goal), // Open options dialog
                )
              );
            },
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddGoalDialog(context), // Open add goal dialog
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddGoalDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Goal'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter goal title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog without action
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newGoal = Goal()
                  ..title = titleController.text.trim()
                  ..categoryId = widget.categoryId;
                if (newGoal.title.isNotEmpty) {
                  ref.read(goalNotifierProvider(widget.categoryId).notifier).addGoal(newGoal); // Add new goal to state
                }
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showGoalOptionsDialog(BuildContext context, Goal goal) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Goal Options'),
          content: Text('What would you like to do with "${goal.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the options dialog
                _showEditGoalDialog(context, goal); // Open the edit dialog
              },
              child: Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the options dialog
                _showDeleteConfirmationDialog(context, goal); // Confirm deletion
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showEditGoalDialog(BuildContext context, Goal goal) {
    final TextEditingController editController = TextEditingController(text: goal.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Goal'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: 'Enter new title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog without changes
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final updatedTitle = editController.text.trim();
                if (updatedTitle.isNotEmpty) {
                  final updatedGoal = goal..title = updatedTitle;
                  ref.read(goalNotifierProvider(widget.categoryId).notifier).updateGoal(updatedGoal); // Update goal in state
                }
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Show confirmation dialog to delete a goal
  void _showDeleteConfirmationDialog(BuildContext context, Goal goal) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Goal'),
          content: Text('Are you sure you want to delete "${goal.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog without deleting
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ref.read(goalNotifierProvider(widget.categoryId).notifier).deleteGoal(goal.id); // Confirm and delete goal
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}