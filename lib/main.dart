import 'package:flutter/material.dart';
import 'package:to_do_application/Pages/task_form.dart';
import 'package:to_do_application/features/todo/view/todo_page.dart';
import 'package:to_do_application/utils/myroutes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo Application",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      //home: TaskForm(),
      initialRoute: MyRoutes.taskform,
      routes: {
        MyRoutes.todoPage: (context) => TodoPage(),
        MyRoutes.taskform: (context) => TaskForm()
      },
    );
  }
}
