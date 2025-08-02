import 'package:flutter/material.dart';
import 'package:flutter_mastering/models/old_todo_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TodoCardComponent extends StatelessWidget {
  const TodoCardComponent({super.key});

  final String checkBoxTrue = 'assets/todo_screen_assets/checkbox_true.svg';
  final String checkBoxFalse = 'assets/todo_screen_assets/checkbox_false.svg';

  @override
  Widget build(BuildContext context) {
    return Consumer<OldTodoModel>(
      builder: (context, todo, child) {
        return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: todo.getTodoList.entries.map((map) {
              var entry = map.value.entries.first;

              return AnimatedOpacity(
                key: ValueKey(map.key),
                opacity: entry.value ? 0.0 : 1.0,
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: entry.value
                              ? SvgPicture.asset(checkBoxTrue)
                              : SvgPicture.asset(checkBoxFalse),
                        ),
                        Container(
                          width: 2,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          entry.key,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList());
      },
    );
  }
}
