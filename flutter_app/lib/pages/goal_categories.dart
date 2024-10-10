import 'package:flutter/material.dart';

import 'package:flutter_app/ui_components/app_bar.dart';
import 'package:flutter_app/ui_components/buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/state_managers/goal_categories.dart';
import 'package:flutter_app/models/goal_categories.dart';

class GoalCategoriesScreen extends ConsumerWidget {
  const GoalCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalCategoryNotifier = ref.watch(goalCategoryNotifierProvider.notifier); // Watch notifier for loading state
    final goalCategory = ref.watch(goalCategoryNotifierProvider); // Watch goals list
    
    return Scaffold(
      appBar: MyCustomAppBar(),
      body: goalCategoryNotifier.isLoading ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : goalCategory.isEmpty ? Center(child: Text('Click the + to add a goal'))
          : ListView.builder(
            itemCount: goalCategory.length,
            itemBuilder: (context, index) {
              final category = goalCategory[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NavButton(
                  title: category.title,
                  onPress: () => Navigator.pushNamed(context, '/goals', arguments: {'categoryId': category.id}),
                  onLongPress: () => _showGoalCategoryOptionsDialog(context, ref, category), // Open options dialog
                )
              );
            },
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddGoalCategoryDialog(context, ref), // Open add goal dialog
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddGoalCategoryDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Category'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter category title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog without action
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newCategory = GoalCategory()..title = titleController.text.trim();
                if (newCategory.title.isNotEmpty) {
                  ref.read(goalCategoryNotifierProvider.notifier).addGoalCategory(newCategory); // Add new goal to state
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

  void _showGoalCategoryOptionsDialog(BuildContext context, WidgetRef ref, GoalCategory goalCategory) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Goal Options'),
          content: Text('What would you like to do with "${goalCategory.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the options dialog
                _showEditGoalCategoryDialog(context, ref, goalCategory); // Open the edit dialog
              },
              child: Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the options dialog
                _showDeleteConfirmationDialog(context, ref, goalCategory); // Confirm deletion
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showEditGoalCategoryDialog(BuildContext context, WidgetRef ref, GoalCategory goalCategory) {
    final TextEditingController editController = TextEditingController(text: goalCategory.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Category'),
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
                  final updatedCategory = goalCategory..title = updatedTitle;
                  ref.read(goalCategoryNotifierProvider.notifier).updateGoalCategory(updatedCategory); // Update goal in state
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
  void _showDeleteConfirmationDialog(BuildContext context, WidgetRef ref, GoalCategory goalCategory) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Category'),
          content: Text('Are you sure you want to delete "${goalCategory.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog without deleting
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ref.read(goalCategoryNotifierProvider.notifier).deleteGoalCategory(goalCategory.id); // Confirm and delete goal
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