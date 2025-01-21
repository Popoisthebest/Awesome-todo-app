import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mastering/screens/todo_screens/old_todo_screen.dart';
import 'package:flutter_mastering/screens/todo_screens/widgets/neumorphism_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // 회원 관리 코드(회원가입, 로그인)
  final credential = FirebaseAuth.instance;

  final TextEditingController userNameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                            key: loginFormKey,
                            child: TextFormField(
                              controller: userNameTextEditingController,
                              cursorColor: Colors.grey,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '사용자 이름을 입력해 주세요.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: '사용자 이름을 입력하세요.',
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
                            key: loginFormKey,
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
                            key: loginFormKey,
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
                    if (loginFormKey.currentState!.validate()) {
                      try {
                        await credential
                            .createUserWithEmailAndPassword(
                          email: emailTextEditingController.text,
                          password: passwordTextEditingController.text,
                        )
                            .then(
                          (value) async {
                            FirebaseAuth.instance.authStateChanges().listen(
                              (User? user) {
                                if (user != null) {
                                  FirebaseFirestore.instance
                                      .collection("USER")
                                      .doc(user.uid)
                                      .set(
                                    {
                                      'userName':
                                          userNameTextEditingController.text,
                                      'userEmail': user.email,
                                    },
                                  );
                                }
                              },
                            );
                            try {
                              credential
                                  .signInWithEmailAndPassword(
                                email: emailTextEditingController.text,
                                password: passwordTextEditingController.text,
                              )
                                  .then(
                                (value) {
                                  debugPrint('로그인 성공');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OldTodoScreen(),
                                    ),
                                  );
                                },
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                debugPrint('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                debugPrint(
                                    'Wrong password provided for that user.');
                              }
                            }
                          },
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          debugPrint('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          debugPrint(
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: const Text('회원가입')),
            ],
          ),
        ),
      ),
    );
  }
}
