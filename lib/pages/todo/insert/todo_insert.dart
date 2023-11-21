import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/task_repository.dart';
import '../../../data/repositories/task_repository_impl.dart';
import '../../utils/layout.dart';
import 'controller/controllers.dart';
import 'layouts/todo_insert_large_comp.dart';
import 'layouts/todo_insert_medium_comp.dart';
import 'layouts/todo_insert_small_dialog.dart';

class TodoInsert {
  Widget resource(BuildContext context) {
    log('TodoInsertRoute.page');

    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            database: context.read<CollectionBox>(),
          ),
        ),
        Provider<TaskInsertCubit>(
          create: (context) =>
              TaskInsertCubit(repository: context.read<TaskRepository>()),
        )
      ],
      builder: (context, child) {
        return const Layout(
          small: TodoInsertSmallDialog(),
          medium: TodoInsertMediumComp(),
          large: TodoInsertCompLarge(),
        );
      },
    );
  }
}
