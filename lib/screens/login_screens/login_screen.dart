import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mastering/models/todo_firebase_model.dart';
import 'package:flutter_mastering/screens/todo_screens/todo_add_screen.dart';
import 'package:flutter_mastering/screens/todo_screens/todo_screen.dart';
import 'package:flutter_mastering/screens/todo_screens/widgets/neumorphism_container.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const storage = FlutterSecureStorage();
  // 회원 관리 코드(회원가입, 로그인)
  final credential = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController =
        TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
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
                            key: TodoAddScreen().formKey,
                            child: TextFormField(
                              controller: emailTextEditingController,
                              cursorColor: Colors.grey,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '이메일을 입력해 주세요.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: '이메일을 입력하세요.',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade500),
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
                            key: TodoAddScreen().formKey,
                            child: TextFormField(
                              controller: passwordTextEditingController,
                              cursorColor: Colors.grey,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '비밀번호를 입력해 주세요.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: '비밀번호을 입력하세요.',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade500),
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
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  // write 함수를 통하여 key에 맞는 정보를 적게 됩니다.
                  //{"login" : "id id_value password password_value"}
                  //와 같은 형식으로 저장이 된다고 생각을 하면 됩니다.
                  await storage.write(
                      key: "login",
                      value:
                          "email ${emailTextEditingController.text} password ${passwordTextEditingController.text}");

                  // TodoFirebaseModel todoFirebaseModel = TodoFirebaseModel();
                  // todoFirebaseModel.login(
                  //   emailTextEditingController.text,
                  //   passwordTextEditingController.text,
                  // );

                  try {
                    credential
                        .signInWithEmailAndPassword(
                      email: emailTextEditingController.text,
                      password: passwordTextEditingController.text,
                    )
                        .then(
                      (value) {
                        print('로그인 성공');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TodoScreen(),
                          ),
                        );
                      },
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },
                child: const Text('로그인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
