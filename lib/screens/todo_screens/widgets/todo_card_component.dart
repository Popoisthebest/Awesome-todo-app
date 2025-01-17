import 'package:flutter/material.dart';
import 'package:flutter_mastering/models/todo_model.dart';
import 'package:provider/provider.dart';

class TodoCardComponent extends StatefulWidget {
  const TodoCardComponent({super.key});

  @override
  State<TodoCardComponent> createState() => _TodoCardComponentState();
}

class _TodoCardComponentState extends State<TodoCardComponent> {
  @override
  Widget build(BuildContext context) {
    // Provider 관여 부분
    return Consumer<TodoModel>(
      builder: (context, todo, child) {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: todo.getTodoList.entries.map((map) {
            // TodoModel의 필드의 값인 map구조를 불러오기 위한 선언
            var entry = map.value.entries.first;

            return AnimatedOpacity(
              key: ValueKey(map.key), // 각 항목을 구분할 수 있도록 고유한 Key 사용
              opacity: entry.value ? 0.0 : 1.0, // 완료 상태에 따라 opacity 변경
              duration: const Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(0, 0),
                          blurRadius: 0,
                          spreadRadius: 0,
                        ),
                        const BoxShadow(
                          color: Color(0xFFE0E5EC),
                          offset: Offset(4, 4),
                          blurRadius: 5,
                          spreadRadius: -1,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<TodoModel>()
                                  .onCompletedClick(map.key);
                              // 1초 후 Todo삭제
                              Future.delayed(const Duration(seconds: 1), () {
                                context.read<TodoModel>().deleteTodo(map.key);
                              });
                            },
                            icon: entry.value
                                ? const Icon(Icons.check_circle_outline)
                                : const Icon(Icons.circle_outlined),
                          ),
                          Text(
                            entry.key,
                            style: TextStyle(
                                fontSize: 20,
                                decoration: entry.value
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
