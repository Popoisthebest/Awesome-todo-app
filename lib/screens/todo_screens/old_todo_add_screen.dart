import 'package:flutter/material.dart';
import 'package:flutter_mastering/models/todo_model.dart';
import 'package:flutter_mastering/screens/todo_screens/old_todo_screen.dart';
import 'package:flutter_mastering/screens/todo_screens/widgets/neumorphism_container.dart';
import 'package:provider/provider.dart';

class OldTodoAddScreen extends StatelessWidget {
  OldTodoAddScreen({super.key});

  final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      body: Center(
        child: NeumorphismContainer(
          width: 300,
          padding: const EdgeInsets.all(20),
          isTextField: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Todo',
                  style: TextStyle(
                    color: const Color(0xFFE0E5EC),
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      const Shadow(
                        color: Colors.white,
                        offset: Offset(-2, -2),
                        blurRadius: 5,
                      ),
                      Shadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(2, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),
              // 할 일 일력 TextField
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                child: Stack(
                  children: [
                    NeumorphismContainer(
                      height: 50,
                      padding: const EdgeInsets.only(left: 7),
                      isTextField: true,
                    ),
                    Transform.translate(
                      offset: const Offset(5, 0),
                      child: Form(
                        key: addFormKey,
                        child: TextFormField(
                          controller: textEditingController,
                          cursorColor: Colors.grey,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '할 일을 입력해 주세요.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: '할 일을 입력하세요.',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  if (addFormKey.currentState!.validate()) {
                    context
                        .read<TodoModel>()
                        .addTodo(textEditingController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OldTodoScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 186, 82, 255),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      // 우하단 그림자(어두움)
                      BoxShadow(
                        color: Colors.purple.shade400,
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: const Center(
                      child: Text(
                    'ADD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
