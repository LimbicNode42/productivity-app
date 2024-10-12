import 'package:flutter/material.dart';

class CustomRecurrenceDialog extends StatefulWidget {
  final Function(String) onRecurrenceSelected;

  CustomRecurrenceDialog({required this.onRecurrenceSelected});

  @override
  _CustomRecurrenceDialogState createState() => _CustomRecurrenceDialogState();
}

class _CustomRecurrenceDialogState extends State<CustomRecurrenceDialog> {
  int repeatEvery = 1;
  String frequency = 'week';
  List<bool> daysOfWeek = [false, false, false, false, false, false, false];
  String endType = 'Never';
  DateTime? endDate;
  int occurrences = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Custom Recurrence'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Repeat every'),
                SizedBox(width: 10),
                DropdownButton<int>(
                  value: repeatEvery,
                  items: List.generate(30, (index) => index + 1).map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      repeatEvery = value!;
                    });
                  },
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: frequency,
                  items: ['day', 'week', 'month', 'year']
                      .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      frequency = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Repeat on'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                  .asMap()
                  .entries
                  .map((entry) {
                    int idx = entry.key;
                    String day = entry.value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          daysOfWeek[idx] = !daysOfWeek[idx];
                        });
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: daysOfWeek[idx]
                            ? Theme.of(context).primaryColor
                            : Colors.grey[300],
                        child: Text(
                          day,
                          style: TextStyle(
                            color: daysOfWeek[idx] ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  })
                  .toList(),
            ),
            SizedBox(height: 20),
            Text('Ends'),
            RadioListTile<String>(
              title: const Text('Never'),
              value: 'Never',
              groupValue: endType,
              onChanged: (value) {
                setState(() {
                  endType = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('On'),
              value: 'On',
              groupValue: endType,
              onChanged: (value) {
                setState(() {
                  endType = value!;
                });
              },
            ),
            if (endType == 'On')
              InkWell(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      endDate = picked;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 10),
                      Text(endDate != null
                          ? "${endDate!.toLocal()}".split(' ')[0]
                          : "Pick a date"),
                    ],
                  ),
                ),
              ),
            RadioListTile<String>(
              title: const Text('After'),
              value: 'After',
              groupValue: endType,
              onChanged: (value) {
                setState(() {
                  endType = value!;
                });
              },
            ),
            if (endType == 'After')
              Row(
                children: [
                  Text('Occurrences'),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      initialValue: occurrences.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        occurrences = int.tryParse(value) ?? occurrences;
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Construct the recurrence pattern string
            String recurrencePattern = "Every $repeatEvery $frequency";
            if (frequency == 'week') {
              List<String> selectedDays = [];
              List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
              for (int i = 0; i < daysOfWeek.length; i++) {
                if (daysOfWeek[i]) {
                  selectedDays.add(days[i]);
                }
              }
              if (selectedDays.isNotEmpty) {
                recurrencePattern += " on ${selectedDays.join(', ')}";
              }
            }

            // Send the recurrence pattern back via callback
            widget.onRecurrenceSelected(recurrencePattern);

            Navigator.pop(context);
          },
          child: Text('Done'),
        ),
      ],
    );
  }
}
