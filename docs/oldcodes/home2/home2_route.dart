import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:adaptative/data/repositories/task_repository_impl.dart';
import 'package:adaptative/pages/home/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import 'controller/controllers.dart';
import 'home2_page.dart';

class Home2Route {
  Widget page(BuildContext context) {
    log('Home2Route.page');

    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            database: context.read<Isar>(),
          ),
        ),
        Provider<Home2PageController>(
          create: (context) => Home2PageController(
            repository: context.read<TaskRepository>(),
          ),
        )
      ],
      builder: (context, child) => Home2Page(
        homePageController: context.read<Home2PageController>(),
      ),
    );
  }
}
