import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/viewmodals/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  // 🔥 Task add karo
                  final taskProvider = Provider.of<TaskProvider>(context, listen: false);
                  taskProvider.addTask(_controller.text);

                  // Wapas home screen par jao
                  Navigator.pop(context);
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}