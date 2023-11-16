import 'package:adaptative/data/models/task.dart';
import 'package:isar/isar.dart';

import './task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Isar database;

  TaskRepositoryImpl({required this.database});
  @override
  Future<List<Task>> list() async {
    final tasks = await database.tasks.where().findAll();
    return tasks;
  }
}
