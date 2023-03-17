import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_application/features/todo/view/todo_page.dart';
import 'package:to_do_application/utils/myroutes.dart';

class TaskForm extends StatelessWidget {
  //const TaskForm({super.key});
  final _formKey = GlobalKey<FormState>();

  void goToToDoPage() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Task")),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
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
                  Navigator.pushNamed(context, MyRoutes.todoPage);
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
