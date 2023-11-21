import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:adaptative/data/repositories/task_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../utils/layout.dart';
import 'controller/controllers.dart';
import 'layouts/todo_list_large_page.dart';
import 'layouts/todo_list_medium_page.dart';
import 'layouts/todo_list_small_page.dart';

class TodoListRoute {
  Widget resource(BuildContext context) {
    log('TodoListRoute.page');

    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            database: context.read<CollectionBox>(),
          ),
        ),
        Provider<TaskListController>(
          create: (context) => TaskListController(
            repository: context.read<TaskRepository>(),
          ),
        )
      ],
      builder: (context, child) => const Layout(
        small: TodoListSmallPage(),
        medium: TodoListMediumPage(),
        large: TodoListLargePage(),
      ),
    );
  }
}
