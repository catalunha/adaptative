import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../insert/todo_insert.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/task_list.dart';

class TodoListLargePage extends StatefulWidget {
  const TodoListLargePage({super.key});

  @override
  State<TodoListLargePage> createState() => _TodoListLargePageState();
}

class _TodoListLargePageState extends State<TodoListLargePage> {
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
                    builder: (_) => TodoInsert().resource(context),
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
