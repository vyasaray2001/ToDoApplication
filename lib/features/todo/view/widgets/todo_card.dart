import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/todo_task.dart';
import '../../viewmodel/todo_viewmodel.dart';

class TodoTaskCard extends ConsumerWidget {
  const TodoTaskCard({
    super.key,
    required this.task,
  });
  final TodoTask task;
  @override
  Widget build(BuildContext context, ref) {
    return Card(
      child: ListTile(
        title: Text(task.task),
        trailing: IconButton(
            onPressed: () {
              ref.read(TodoViewModel.provider.notifier).removeTask(task);
            },
            icon: Icon(Icons.delete)),
      ),
    );
  }
}
