import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:adaptative/data/repositories/task_repository_impl.dart';
import 'package:adaptative/pages/home/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class HomeRoute {
  Widget page(BuildContext context) {
    log('HomeRoute.page');

    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            database: context.read<Isar>(),
          ),
        ),
        Provider<HomePageController>(
          create: (context) => HomePageController(
            repository: context.read<TaskRepository>(),
          ),
        )
      ],
      builder: (context, child) => HomePage(
        homePageController: context.read<HomePageController>(),
      ),
    );
  }
}
