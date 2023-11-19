import 'dart:developer';

import 'package:adaptative/core/app_enviroment/controllers.dart';
import 'package:adaptative/core/app_enviroment/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/task.dart';
import '../../../../routes.dart';
import '../../update/todo_update_route.dart';
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
          final appEnv = context.read<AppEnviromentCubit>();

          if (appEnv.state.layoutSize.isLarge) {
            final isUpdated = await Navigator.of(context)
                    .pushNamed(RouteName.todoUpdate, arguments: widget.model)
                as bool?;
            log('isUpdated: $isUpdated');
            if (mounted) {
              if (isUpdated != null && isUpdated) {
                context.read<TaskListController>().loading();
              }
            }
          } else {
            final isInsert = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return TodoUpdateRoute().page(context, widget.model);
              },
            );
            log('$isInsert');
            if (mounted) {
              if (isInsert != null && isInsert) {
                context.read<TaskListController>().loading();
              }
            }
          }
        },
        icon: const Icon(Icons.edit),
      ),
      // trailing: IconButton(
      //   onPressed: () async {
      //     final isInsert = await showDialog(
      //       barrierDismissible: false,
      //       context: context,
      //       builder: (context) {
      //         return TodoUpdateRoute().page(context, widget.model);
      //       },
      //     );
      //     log('$isInsert');
      //     if (mounted) {
      //       if (isInsert != null && isInsert) {
      //         context.read<TaskListController>().loading();
      //       }
      //     }
      //   },
      //   icon: const Icon(Icons.edit),
      // ),
    );
  }
}
