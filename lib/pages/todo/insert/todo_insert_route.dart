import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/task_repository.dart';
import '../../../data/repositories/task_repository_impl.dart';
import 'controller/controllers.dart';
import 'todo_insert_page.dart';

class TodoInsertRoute {
  Widget page(BuildContext context) {
    log('TodoInsertRoute.page');

    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            database: context.read<Isar>(),
          ),
        ),
        Provider<TaskInsertCubit>(
          create: (context) =>
              TaskInsertCubit(repository: context.read<TaskRepository>()),
        )
      ],
      builder: (context, child) => const TodoInsertPage(),
    );
  }
}
