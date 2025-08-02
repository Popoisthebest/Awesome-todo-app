import 'package:flutter/material.dart';
import 'package:flutter_mastering/screens/todo_screens/widgets/todo_custom_button.dart';

class TodoAddButton extends StatelessWidget {
  const TodoAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/todo_add_screen');
      },
      child: const TodoCustomButton(
        isBorder: true,
        title: '할 일 추가',
        color: Colors.white,
        textColor: Colors.black,
      ),
    );
  }
}
