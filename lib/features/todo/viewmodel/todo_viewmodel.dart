import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_application/features/todo/model/todo_task.dart';

class TodoViewModel extends StateNotifier<List<TodoTask>> {
  static final provider =
      StateNotifierProvider<TodoViewModel, List<TodoTask>>((ref) {
    return TodoViewModel();
  });
  TodoViewModel() : super([]);

  void addTask(TodoTask task) {
    state = [...state, task];
  }

  void removeTask(TodoTask task) {
    state = [...(state..remove(task))];
  }
}
