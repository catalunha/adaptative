import 'package:adaptative/data/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';

import './task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Box database;

  TaskRepositoryImpl({required this.database});
  @override
  List<Task> list() {
    final tasks = database.values.map((e) => Task.fromJson(e)).toList();
    tasks.sort(
      (a, b) => a.title.compareTo(b.title),
    );
    return tasks;
  }

  @override
  Future<bool> upsert(Task task) async {
    await database.put(task.id, task.toJson());
    return true;
  }

  @override
  Future<bool> detele(String id) async {
    await database.delete(id);
    return true;
  }
}
