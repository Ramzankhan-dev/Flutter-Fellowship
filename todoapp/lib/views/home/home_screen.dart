import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/viewmodals/task_provider.dart';
import '../widgets/task_tile.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 📊 Provider se data lena
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo App'),
        centerTitle: true,
      ),

      body: taskProvider.tasks.isEmpty
          ? Center(
              // 🎯 Agar koi task nahi hai
              child: Text(
                'No tasks yet!\nTap + to add one',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              // 📋 Tasks ki list
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];
                return TaskTile(
                  task: task,
                  index: index,
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ➕ New task screen par jao
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}