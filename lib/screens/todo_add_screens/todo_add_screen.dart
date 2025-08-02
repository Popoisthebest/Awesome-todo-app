import 'package:flutter/material.dart';
import 'package:flutter_mastering/screens/todo_add_screens/todo_add_scaffold.dart';
import 'package:flutter_mastering/screens_widgets/todo_add_screen_widgets/todo_add_app_bar.dart';
import 'package:flutter_mastering/screens_widgets/todo_add_screen_widgets/todo_add_text_field.dart';

class TodoAddScreen extends StatelessWidget {
  const TodoAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoAddScaffold(
      todoAddAppBar: const TodoAddAppBar(),
      todoAddTextField: TodoAddTextField(),
    );
  }
}
