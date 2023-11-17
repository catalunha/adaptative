import 'package:flutter/material.dart';

import '../../../data/models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  const TaskList({super.key, required this.tasks});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        final item = widget.tasks[index];
        return ListTile(
          tileColor: Colors.black12,
          leading: item.status
              ? const Icon(Icons.check_box)
              : const Icon(Icons.check_box_outline_blank),
          title: Text(item.title),
          subtitle: Text(item.description),
        );
      },
    );
  }
}
