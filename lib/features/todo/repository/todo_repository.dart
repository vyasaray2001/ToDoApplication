import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_application/features/todo/model/todo_task.dart';

class TodoRepository {
  static final provider = Provider<TodoRepository>((ref) {
    return TodoRepository();
  });

  List<TodoTask> _tasks = [];

  List<TodoTask> getTodoTask() {
    return _tasks.toList();
  }

  void add(TodoTask task) {
    _tasks.add(task);
  }

  void update(TodoTask task) {
    final exisiting = _tasks.firstWhere((element) => task.id == element.id);

    _tasks.remove(exisiting);
    _tasks.add(task);
  }

  void delete(TodoTask task) {
    _tasks.remove(task);
  }
}
