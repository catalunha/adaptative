import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../data/models/task.dart';
import '../../../data/repositories/task_repository.dart';
import '../../../data/repositories/task_repository_impl.dart';
import '../../utils/layout.dart';
import 'controller/controllers.dart';
import 'layouts/todo_update_large_page.dart';
import 'layouts/todo_update_small_dialog.dart';

class TodoUpdate {
  Widget resource(BuildContext context, Task? task) {
    log('TodoUpdateRoute.page');

    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            database: context.read<CollectionBox>(),
          ),
        ),
        Provider<TaskUpdateCubit>(
          create: (context) => TaskUpdateCubit(
            repository: context.read<TaskRepository>(),
            task: task,
          ),
        )
      ],
      builder: (context, child) => const Layout(
        small: TodoUpdateSmallDialog(),
        medium: TodoUpdateSmallDialog(),
        large: TodoUpdateLargePage(),
      ),
    );
  }
}
