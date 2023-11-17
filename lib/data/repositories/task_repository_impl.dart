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

  @override
  Future<bool> upsert(Task task) async {
    final taskUpsert = await database.writeTxn(() => database.tasks.put(task));
    return taskUpsert != 0;
  }

  @override
  Future<bool> detele(int id) async {
    final taskUpsert = await database.writeTxn(() => database.tasks.delete(id));
    return taskUpsert;
  }
}
