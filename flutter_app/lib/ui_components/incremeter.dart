import 'package:flutter/material.dart';

import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/state_managers/tasks.dart';

class CounterTaskWidget extends StatefulWidget {
  final Task task;

  CounterTaskWidget({required this.task});

  @override
  _CounterTaskWidgetState createState() => _CounterTaskWidgetState();
}

class _CounterTaskWidgetState extends State<CounterTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.task.name),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (widget.task.trackedValue > 0) {
                    widget.task.trackedValue--;
                    // Save this updated value to the database
                  }
                });
              },
            ),
            Text(widget.task.trackedValue.toString()), // Show current count
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.task.trackedValue++;
                  // Save this updated value to the database
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
