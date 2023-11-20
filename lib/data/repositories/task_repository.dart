import '../models/task.dart';

abstract interface class TaskRepository {
  List<Task> list();
  Future<bool> upsert(Task task);
  Future<bool> detele(String id);
}
