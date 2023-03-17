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

class TodoTaskCard extends ConsumerStatefulWidget {
  const TodoTaskCard({
    super.key,
    required this.task,
  });
  final TodoTask task;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoTaskCardState();
}

class _TodoTaskCardState extends ConsumerState<TodoTaskCard> {
  bool isClicked = true;
  String compltedTime = "";
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          onChanged: (value) {
            setState(() {
              isClicked = !isClicked;
              if (isClicked) {
                compltedTime = DateTime.now().toString().substring(0, 16);
              } else {
                compltedTime = "";
              }
            });
          },
          value: isClicked,
        ),
        title: Text(
          widget.task.task,
          style: isClicked
              ? TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2.85,
                )
              : TextStyle(),
        ),
        subtitle: Row(
          children: [
            Text(widget.task.addedAt.toString().substring(0, 16)),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(compltedTime),
            )
          ],
        ),
        trailing: IconButton(
            onPressed: () {
              ref.read(TodoViewModel.provider.notifier).removeTask(widget.task);
            },
            icon: Icon(Icons.delete)),
      ),
    );
  }
}
