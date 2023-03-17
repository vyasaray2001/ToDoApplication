import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_application/utils/myroutes.dart';

import '../model/todo_task.dart';
import '../viewmodel/todo_viewmodel.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(TodoViewModel.provider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.taskform);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TodoTaskCard(task: tasks[index]);
          }),
    );
  }
}

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
