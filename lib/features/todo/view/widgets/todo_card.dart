import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/todo_task.dart';
import '../../viewmodel/todo_viewmodel.dart';

// class TodoTaskCard extends ConsumerWidget {
//   const TodoTaskCard({
//     super.key,
//     required this.task,
//   });
//   final TodoTask task;
//   bool isClicked = false;
//   @override
//   Widget build(BuildContext context, ref) {
//     return Card(
//       child: ListTile(
//         leading: Checkbox(
//           onChanged: (value) {
//             isClicked = true;
//           },
//           value: isClicked,
//         ),
//         title: Text(task.task),
//         trailing: IconButton(
//             onPressed: () {
//               ref.read(TodoViewModel.provider.notifier).removeTask(task);
//             },
//             icon: Icon(Icons.delete)),
//       ),
//     );
//   }
// }

class TodoTaskCard extends ConsumerWidget {
  const TodoTaskCard({
    super.key,
    required this.task,
  });
  final TodoTask task;

  @override
  Widget build(BuildContext context, ref) {
    final isCompleted = task.completedAt != null;
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: (value) {
            ref.read(TodoViewModel.provider.notifier).markCompleted(task);
          },
        ),
        title: Text(
          task.task,
          style: isCompleted
              ? TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2.85,
                )
              : null,
        ),
        subtitle: Row(
          children: [
            Text(task.addedAt.toString().substring(0, 16)),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(task.completedAt?.toIso8601String() ?? ""),
            ),
          ],
        ),
        trailing: IconButton(
            onPressed: () {
              ref.read(TodoViewModel.provider.notifier).removeTask(task);
            },
            icon: Icon(Icons.delete)),
      ),
    );
  }
}
