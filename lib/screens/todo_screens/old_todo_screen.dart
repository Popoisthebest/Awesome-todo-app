import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mastering/models/todo_model.dart';
import 'package:flutter_mastering/screens/todo_screens/old_todo_add_screen.dart';
import 'package:flutter_mastering/screens/welcome_screens/welcome_screen.dart';
import 'package:flutter_mastering/screens/todo_screens/widgets/neumorphism_container.dart';
import 'package:flutter_mastering/screens/todo_screens/widgets/todo_card_component.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class OldTodoScreen extends StatefulWidget {
  const OldTodoScreen({super.key});

  @override
  State<OldTodoScreen> createState() => _OldTodoScreenState();
}

class _OldTodoScreenState extends State<OldTodoScreen> {
  String dataNotExistImage =
      'assets/todo_screen_assets/data_not_exist_3d_image.png';
  static const storage = FlutterSecureStorage();

  String userName = '';

  @override
  void initState() {
    super.initState();
    context.read<TodoModel>().initAuthSystem();
    userName = context.read<TodoModel>().getUserName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 로그아웃
              IconButton(
                  onPressed: () async {
                    await storage.delete(key: 'login');
                    await FirebaseAuth.instance.signOut();

                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.output_rounded)),
              // Provider 관여 부분
              Consumer<TodoModel>(
                builder: (context, todo, child) {
                  return NeumorphismContainer(
                    padding: const EdgeInsets.all(20),
                    isTextField: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${context.read<TodoModel>().getUserName}\'s Todos',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          todo.getTodoList.length.toString(),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer<TodoModel>(
                builder: (context, todo, child) {
                  return Expanded(
                    child: NeumorphismContainer(
                      padding: const EdgeInsets.all(20),
                      isTextField: false,
                      child: todo.getDataExist
                          ? const SingleChildScrollView(
                              child: TodoCardComponent())
                          : Center(
                              child: Image.asset(dataNotExistImage),
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OldTodoAddScreen()));
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 186, 82, 255),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.shade400,
                        blurRadius: 20,
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
