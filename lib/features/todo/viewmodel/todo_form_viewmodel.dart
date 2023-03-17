import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoFormViewModel extends ChangeNotifier {
  static final provider =
      ChangeNotifierProvider.autoDispose<TodoFormViewModel>((ref) {
    return TodoFormViewModel();
  });
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
}
