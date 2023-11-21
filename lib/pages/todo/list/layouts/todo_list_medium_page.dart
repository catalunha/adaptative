import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../insert/todo_insert.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/task_list.dart';

class TodoListMediumPage extends StatefulWidget {
  const TodoListMediumPage({super.key});

  @override
  State<TodoListMediumPage> createState() => _TodoListMediumPageState();
}

class _TodoListMediumPageState extends State<TodoListMediumPage> {
  @override
  Widget build(BuildContext context) {
    log('TodoListPageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Listar (TodoListPageMedium)"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20.0),
            child: TodoInsert().resource(context),
          ),
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
