import 'package:flutter/material.dart';
import 'package:flutter_mastering/models/old_todo_model.dart';
import 'package:flutter_mastering/screens/todo_screens/widgets/todo_card_component.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  final String todoTitleIcon = 'assets/todo_screen_assets/todo_title_icon.svg';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(todoTitleIcon),
              const SizedBox(width: 5),
              Consumer(
                builder: (context, todo, child) {
                  return Text(
                    "${context.read<OldTodoModel>().getUserName} 할 일 리스트",
                    style: const TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          const TodoCardComponent(),
        ],
      ),
    );
  }
}
