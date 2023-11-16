import '../models/task.dart';

abstract interface class TaskRepository {
  Future<List<Task>> list();
}
