import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/modals/task_modal.dart';
import 'package:todoapp/viewmodals/task_provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;     // Ye task display karna hai
  final int index;     // List mein iska index

  TaskTile({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // ✅ Checkbox - Task complete ya nahi
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          // Jab checkbox click karein
          final taskProvider = Provider.of<TaskProvider>(context, listen: false);
          taskProvider.toggleTask(index);
        },
      ),

      // 📝 Task Title
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 16,
          // Agar complete hai toh line-through
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),

      // 🕒 Time
      subtitle: Text(
        'Created: ${_formatTime(task.createdAt)}',
        style: TextStyle(fontSize: 12),
      ),

      // 🗑️ Delete Button
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          final taskProvider = Provider.of<TaskProvider>(context, listen: false);
          taskProvider.deleteTask(index);
        },
      ),
    );
  }

  // Time format karne ka helper function
  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute} ${time.day}/${time.month}';
  }
}