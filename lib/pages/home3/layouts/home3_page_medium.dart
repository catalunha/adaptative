import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_loader.dart';
import '../../utils/app_messages.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/task_list.dart';

class Home3PageMedium extends StatefulWidget {
  const Home3PageMedium({super.key});

  @override
  State<Home3PageMedium> createState() => _Home3PageMediumState();
}

class _Home3PageMediumState extends State<Home3PageMedium>
    with AppLoader, AppMessages {
  @override
  Widget build(BuildContext context) {
    log('Home3PageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de ToDo's em L3Medium2"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await context.read<TaskListController>().loading();
            },
            child: const Text('Reloading...'),
          ),
          Flexible(
            child: BlocBuilder<TaskListController, TaskListState>(
              builder: (context, state) {
                switch (state) {
                  case TaskListStateInitial():
                    return const SizedBox();
                  case TaskListStateLoading():
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  case TaskListStateLoaded():
                    return TaskList(
                      tasks: state.tasks,
                    );
                  case TaskListStateError():
                    return Center(
                      child: Text(state.error ?? ''),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
