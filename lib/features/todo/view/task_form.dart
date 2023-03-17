import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_application/features/todo/view/todo_page.dart';
import 'package:to_do_application/features/todo/viewmodel/todo_form_viewmodel.dart';
import 'package:to_do_application/utils/myroutes.dart';

import '../model/todo_task.dart';
import '../viewmodel/todo_viewmodel.dart';

class TaskForm extends ConsumerWidget {
  const TaskForm({super.key});

  void goToToDoPage(
      BuildContext context, TodoFormViewModel formViewModel, WidgetRef ref) {
    if (formViewModel.formKey.currentState?.validate() ?? false) {
      var num = Random().nextInt(1000);
      ref.read(TodoViewModel.provider.notifier).addTask(TodoTask(
          id: num,
          task: formViewModel.controller.text.toString(),
          addedAt: DateTime.now()));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    final formViewModel = ref.watch(TodoFormViewModel.provider);
    final tasks = ref.watch(TodoViewModel.provider);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Task")),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          children: [
            Form(
              key: formViewModel.formKey,
              child: TextFormField(
                controller: formViewModel.controller,
                decoration: InputDecoration(
                    label: Text("Task Name"),
                    hintText: "Enter Your Task Here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                validator: (value) {
                  if (value == "") {
                    return "Task Field Cannot be empty";
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  goToToDoPage(context, formViewModel, ref);
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
