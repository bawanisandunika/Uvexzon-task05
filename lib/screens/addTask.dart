import 'package:flutter/material.dart';
import 'package:task_05/screens/authentication.dart';
import 'package:task_05/screens/category.dart'; // Make sure to import CategoryScreen

class AddTaskScreen extends StatefulWidget {
  final String email; // Add email parameter

  const AddTaskScreen({Key? key, required this.email})
      : super(key: key); // Update constructor

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskScreen> {
  final TextEditingController taskController = TextEditingController();
  final AuthenticationService authService = AuthenticationService();
  String? priority = "Medium"; // Default priority

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Logged in as: ${widget.email}"), // Display email
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: "Task Description",
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onLongPress: () {
                // Navigate to CategoryScreen on long press
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryScreen()),
                );
              },
              child: DropdownButton<String>(
                value: priority,
                items: <String>["Low", "Medium", "High"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    priority = newValue;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitTask,
              child: const Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitTask() async {
    String? result = await authService.addTask(
      taskDescription: taskController.text.trim(),
      priority: priority!, // Ensure a non-null value
    );
    if (result == null) {
      print("Task added successfully");
      taskController.clear(); // Clear the input field
    } else {
      print("Error adding task: $result");
    }
  }
}
