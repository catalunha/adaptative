import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../insert/todo_insert_route.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/task_list.dart';

class TodoListPageMedium extends StatefulWidget {
  const TodoListPageMedium({super.key});

  @override
  State<TodoListPageMedium> createState() => _TodoListPageMediumState();
}

class _TodoListPageMediumState extends State<TodoListPageMedium> {
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
            child: TodoInsertRoute().page(context),
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
