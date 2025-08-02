import 'package:flutter/material.dart';
import 'package:flutter_mastering/screens/todo_screens/todo_scaffold.dart';
import 'package:flutter_mastering/screens_widgets/todo_screen_widgets/todo_add_button.dart';
import 'package:flutter_mastering/screens_widgets/todo_screen_widgets/todo_app_bar.dart';
import 'package:flutter_mastering/screens_widgets/todo_screen_widgets/todo_list.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TodoScaffold(
      todoAppBar: TodoAppBar(),
      todoList: TodoList(),
      todoAddButton: TodoAddButton(),
    );
  }
}
