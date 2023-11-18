import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/task.dart';
import '../controller/controllers.dart';
import 'task_card.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  const TaskList({
    super.key,
    required this.tasks,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<TaskListController>();
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        final item = widget.tasks[index];
        return TaskCard(
          model: item,
          onChanged: (value) {
            final itemUpdated = item.copyWith(status: value);
            controller.update(itemUpdated);
          },
        );
      },
    );
  }
}
