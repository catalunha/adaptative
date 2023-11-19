import 'dart:developer';

import 'package:adaptative/core/app_enviroment/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_enviroment/states.dart';
import '../../insert/todo_insert_route.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/task_list.dart';

class TodoListPageLarge extends StatefulWidget {
  const TodoListPageLarge({super.key});

  @override
  State<TodoListPageLarge> createState() => _TodoListPageLargeState();
}

class _TodoListPageLargeState extends State<TodoListPageLarge> {
  @override
  Widget build(BuildContext context) {
    log('TodoListPageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Listar (TodoListPageLarge)"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
              margin: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: const Text('Criar'),
                onPressed: () async {
                  final isInsert = await showModalBottomSheet(
                    isDismissible: false,
                    context: context,
                    builder: (_) => TodoInsertRoute().page(context),
                  );
                  log('showModalBottomSheet: $isInsert');
                  if (mounted) {
                    if (isInsert != null && isInsert) {
                      context.read<TaskListController>().loading();
                    }
                  }
                },
              )),
          Flexible(
            child: BlocBuilder<TaskListController, TaskListState>(
              builder: (context, state) {
                return switch (state.status) {
                  TaskListStateStatus.initial => const SizedBox(),
                  TaskListStateStatus.loading =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                  TaskListStateStatus.loaded => TaskList(
                      tasks: state.tasks,
                    ),
                  TaskListStateStatus.error =>
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
