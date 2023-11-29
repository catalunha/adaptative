import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_loader.dart';
import '../../../utils/app_messages.dart';
import '../../insert/todo_insert.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/task_list.dart';

class TodoListSmallPage extends StatefulWidget {
  const TodoListSmallPage({super.key});

  @override
  State<TodoListSmallPage> createState() => _TodoListSmallPageState();
}

class _TodoListSmallPageState extends State<TodoListSmallPage>
    with AppLoader, AppMessages {
  @override
  Widget build(BuildContext context) {
    log('TodoListPageSmall.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Listar (TodoListPageSmall)"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final isInsert = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return TodoInsert().resource(context);
            },
          );
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
