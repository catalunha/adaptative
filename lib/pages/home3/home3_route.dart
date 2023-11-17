import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:adaptative/data/repositories/task_repository_impl.dart';
import 'package:adaptative/pages/home3/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import 'home3_page.dart';

class Home3Route {
  Widget page(BuildContext context) {
    log('Home3Route.page');

    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            database: context.read<Isar>(),
          ),
        ),
        Provider<TaskListController>(
          create: (context) => TaskListController(
            repository: context.read<TaskRepository>(),
          ),
        )
      ],
      builder: (context, child) => Home3Page(
        taskListController: context.read<TaskListController>(),
      ),
    );
  }
}
