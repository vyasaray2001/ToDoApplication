import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_application/features/todo/model/todo_task.dart';
import 'package:to_do_application/features/todo/repository/todo_repository.dart';

class TodoViewModel extends StateNotifier<List<TodoTask>> {
  static final provider =
      StateNotifierProvider<TodoViewModel, List<TodoTask>>((ref) {
    return TodoViewModel(ref.watch(TodoRepository.provider));
  });
  TodoViewModel(this._repository) : super([]) {
    _getData();
  }
  final TodoRepository _repository;

  void _getData() {
    state = _repository.getTodoTask();
  }

  void addTask(TodoTask task) {
    _repository.add(task);
    _getData();
  }

  void markCompleted(TodoTask task) {
    _repository.update(task.copyWith(completedAt: DateTime.now()));
    _getData();
  }

  void removeTask(TodoTask task) {
    _repository.delete(task);
    _getData();
  }
}
