import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:adaptative/data/repositories/task_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'controller/controllers.dart';
import 'todo_list_page.dart';

class TodoListRoute {
  Widget page(BuildContext context) {
    log('TodoListRoute.page');

    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            database: context.read<Box>(),
          ),
        ),
        Provider<TaskListController>(
          create: (context) => TaskListController(
            repository: context.read<TaskRepository>(),
          ),
        )
      ],
      builder: (context, child) => const TodoListPage(),
    );
  }
}
