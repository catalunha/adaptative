import 'dart:developer';

import 'package:adaptative/pages/todo/upsert/todo_upsert_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_loader.dart';
import '../../../utils/app_messages.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/task_list.dart';

class TodoListPageSmall extends StatefulWidget {
  const TodoListPageSmall({super.key});

  @override
  State<TodoListPageSmall> createState() => _TodoListPageSmallState();
}

class _TodoListPageSmallState extends State<TodoListPageSmall>
    with AppLoader, AppMessages {
  @override
  Widget build(BuildContext context) {
    log('TodoListPageSmall.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo - List - Small"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final data = await showModalBottomSheet(
          //     context: context,
          //     builder: (_) => TodoUpsertRoute().page(context));
          // if (data != null) {
          //   context.read<TaskListController>().loading();
          // }
          log('+++ showDialog');
          final isInsert = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return TodoUpsertRoute().page(context, null);
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
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          // ElevatedButton(
          //   onPressed: () async {
          //     await context.read<TaskListController>().loading();
          //   },
          //   child: const Text('Reloading...'),
          // ),
          Flexible(
            child: BlocBuilder<TaskListController, TaskListState>(
              builder: (context, state) {
                return switch (state) {
                  TaskListStateInitial() => const SizedBox(),
                  TaskListStateLoading() =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                  TaskListStateLoaded() => TaskList(
                      tasks: state.tasks,
                    ),
                  TaskListStateError() =>
                    Center(child: Text(state.error ?? '')),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
