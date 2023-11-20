import 'dart:convert';

import 'package:adaptative/data/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final CollectionBox database;

  TaskRepositoryImpl({required this.database});
  @override
  Future<List<Task>> list() async {
    var map = await database.getAllValues();
    List<Task> tasks = [];
    for (var value in map.values) {
      tasks.add(Task.fromJson(Map<String, dynamic>.from(value)));
    }

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
