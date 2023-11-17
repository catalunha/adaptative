import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import '../../../data/models/task.dart';
import '../../../data/repositories/task_repository.dart';
import '../../../data/repositories/task_repository_impl.dart';
import 'controller/controllers.dart';
import 'todo_upsert_page.dart';

class TodoUpsertRoute {
  Widget page(BuildContext context, Task? task) {
    log('TodoUpsertRoute.page');

    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            database: context.read<Isar>(),
          ),
        ),
        Provider<TaskController>(
          create: (context) => TaskController(
            repository: context.read<TaskRepository>(),
            task: task,
          ),
        )
      ],
      builder: (context, child) => const TodoUpsertPage(),
    );
  }
}
