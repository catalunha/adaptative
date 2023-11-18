import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/task.dart';
import '../../todo/upsert/todo_upsert_route.dart';
import '../controller/controllers.dart';

class TaskCard extends StatefulWidget {
  final Task model;
  final Function(bool?) onChanged;

  const TaskCard({super.key, required this.model, required this.onChanged});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: widget.onChanged,
        value: widget.model.status,
      ),
      title: Text(widget.model.title),
      subtitle: Text(widget.model.description),
      trailing: IconButton(
        onPressed: () async {
          log('+++ showDialog');
          final isInsert = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return TodoUpsertRoute().page(context, widget.model);
            },
          );
          log('--- showDialog');
          log('$isInsert');
          if (mounted) {
            if (isInsert != null && isInsert) {
              context.read<TaskListController>().loading();
            }
          }
        },
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
