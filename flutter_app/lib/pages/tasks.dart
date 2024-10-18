import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/state_managers/tasks.dart';
import 'package:flutter_app/ui_components/barrel.dart'; // Will be need for todos

class TasksPage extends ConsumerStatefulWidget {
  final int goalId;

  TasksPage({required this.goalId});

  @override
  ConsumerState<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends ConsumerState<TasksPage> {
  bool selectionMode = false; // To track if we are in selection mode
  bool isAllSelected = false; // Track the state of the "select all" checkbox
  Set<int> selectedRows = {}; // To track indices of selected rows

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskNotifierProvider(widget.goalId));

    return Scaffold(
      // TODO: Fit this into my custom app bar with composition
      appBar: AppBar(
        title: Text('Tasks'),
        actions: selectionMode
            ? [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Handle deletion of selected tasks
                    final selectedTasks = _getSelectedTasks(tasks);
                    _deleteSelectedTasks(selectedTasks);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    // Exit selection mode
                    setState(() {
                      selectionMode = false;
                      isAllSelected = false;
                      selectedRows.clear();
                    });
                  },
                ),
              ]
            : [],
      ),
      body: tasks.isEmpty
          ? Column(
              children: [
                // Wrap the header row inside a Table
                Table(
                  columnWidths: {
                    if (selectionMode) 0: FixedColumnWidth(40),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },
                  children: [
                    _buildHeaderRow(tasks.length),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text('Click + to add a new task'),
              ],
            )
          : SingleChildScrollView(
              child: Table(
                columnWidths: {
                  if (selectionMode) 0: FixedColumnWidth(40), // Width for selection column
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                },
                border: TableBorder.all(color: Colors.grey),
                children: [
                  _buildHeaderRow(tasks.length), // Header row
                  // Data Rows
                  ...tasks.asMap().entries.map((entry) {
                    final index = entry.key;
                    final task = entry.value;

                    return TableRow(
                      decoration: BoxDecoration(
                        color: selectedRows.contains(index)
                            ? Colors.grey[300]
                            : null,
                      ),
                      children: [
                        if (selectionMode)
                          TableCell(
                            child: Checkbox(
                              value: selectedRows.contains(index),
                              onChanged: (isChecked) {
                                setState(() {
                                  if (isChecked == true) {
                                    selectedRows.add(index);
                                  } else {
                                    selectedRows.remove(index);
                                  }
                                  // Update "Select All" checkbox state
                                  isAllSelected = selectedRows.length == tasks.length;
                                });
                              },
                            ),
                          ),
                        _buildTableCell(task.name),
                        _buildTableCell(task.period),
                        _buildTableCell(task.impact.toString()),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context, ref, widget.goalId),
        child: Icon(Icons.add),
      ),
    );
  }

  // Function to handle header row creation
  TableRow _buildHeaderRow(int taskCount) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[200]),
      children: [
        if (selectionMode)
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Checkbox(
              value: isAllSelected,
              onChanged: (isChecked) {
                setState(() {
                  isAllSelected = isChecked ?? false;
                  if (isAllSelected) {
                    // Select all rows
                    selectedRows = Set<int>.from(List<int>.generate(taskCount, (index) => index));
                  } else {
                    // Deselect all rows
                    selectedRows.clear();
                  }
                });
              },
            ),
          ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Task',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Period',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Impact',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // Function to build table cell with padding
  TableCell _buildTableCell(String text) {
    return TableCell(
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            selectionMode = true; // Enter selection mode
          });
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context, WidgetRef ref, int goalId) {
    final nameController = TextEditingController();
    List<String> trackTypes = ['Counter', 'Checkbox']; // Options for track type
    double impactValue = 1; // Default value for the slider
    String? selectedRecurrence; // This will store the selected recurrence pattern as a string description
    String? selectedTrackType; // Track type selected by the user
    List<int>? selectedDays;
    DateTime? selectedEndDate;
    int? selectedOccurrences;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add Task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Task name input
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Task Name'),
                  ),
                  
                  GestureDetector(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomRecurrenceDialog(
                            onRecurrenceSelected: (String pattern, List<int>? days, DateTime? endDate, int? occurrences) {
                              setState(() {
                                selectedRecurrence = pattern;
                                selectedDays = days;
                                selectedEndDate = endDate;
                                selectedOccurrences = occurrences;
                              });
                            },
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedRecurrence != null
                                ? "Recurrence: $selectedRecurrence"
                                : 'Set Recurrence',
                            style: TextStyle(
                              color: selectedRecurrence == null ? Colors.red : Colors.black, // Optional: show red text if no recurrence selected
                            ),
                          ),
                          Icon(Icons.repeat), // Recurrence icon to represent repeat
                        ],
                      ),
                    ),
                  ),

                  // Dropdown for Track Type Selection
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Track Type'),
                        DropdownButton<String>(
                          value: selectedTrackType,
                          hint: Text('Select Track Type'),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTrackType = newValue;
                            });
                          },
                          items: trackTypes.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  // Slider for Impact
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Impact'),
                        Expanded(
                          child: Slider(
                            value: impactValue,
                            min: 1,
                            max: 10,
                            divisions: 9, // Creates 10 steps on the slider
                            label: impactValue.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                impactValue = value;
                              });
                            },
                          ),
                        ),
                        Text(impactValue.round().toString()),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (selectedRecurrence != null && nameController.text.isNotEmpty && selectedTrackType != null) {
                      // Map the selectedTrackType to either "int" or "bool" based on the dropdown value
                      String trackType = selectedTrackType == 'Counter' ? 'int' : 'bool';
                      DateTime now = DateTime.now();

                      final newTask = Task()
                        ..name = nameController.text
                        ..period = selectedRecurrence!
                        ..impact = impactValue.round()
                        ..goalId = goalId // Link to the goal
                        ..trackType = trackType
                        ..lastReset = now
                        ..resetDays = selectedDays!
                        ..endDate = selectedEndDate
                        .. maxResets = selectedOccurrences;

                      ref.read(taskNotifierProvider(widget.goalId).notifier).addTask(newTask);
                      Navigator.of(context).pop(); // Close dialog
                    } else {
                      // Show an error message if any field is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter all details')),
                      );
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<Task> _getSelectedTasks(List<Task> tasks) {
    // Filter tasks based on their indices being in the selectedRows set
    return tasks.asMap().entries
        .where((entry) => selectedRows.contains(entry.key))
        .map((entry) => entry.value)
        .toList();
  }

  // Function to handle deletion of selected tasks
  void _deleteSelectedTasks(List<Task> tasks) {
    // Implement deletion logic for selected tasks
    // For example, use ref.read(taskNotifierProvider.notifier).deleteTask(taskId)
    // Clear selection and exit selection mode after deletion
    setState(() {
      ref.read(taskNotifierProvider(widget.goalId).notifier).deleteTasks(tasks); // Confirm and delete task
      selectionMode = false;
      isAllSelected = false;
      selectedRows.clear();
    });
  }
}