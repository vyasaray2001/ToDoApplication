import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_application/utils/myroutes.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    );
  }
}
