import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mastering/models/todo_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TodoFirebaseModel {
  // 회원 관리 코드(회원가입, 로그인)
  final credential = FirebaseAuth.instance;
  //user의 정보를 저장하기 위한 변수
  String userInfo = "";
  //flutter_secure_storage 사용을 위한 초기화 작업
  static const storage = FlutterSecureStorage();
  // TodoModel 생성자
  TodoModel todoModel = TodoModel();

  Future<void> signUp(
      String emailTextEditingController,
      String passwordTextEditingController,
      String userNameTextEditingController) async {
    try {
      await credential
          .createUserWithEmailAndPassword(
        email: emailTextEditingController,
        password: passwordTextEditingController,
      )
          .then(
        (value) async {
          FirebaseAuth.instance.authStateChanges().listen(
            (User? user) {
              if (user != null) {
                FirebaseFirestore.instance.collection("USER").doc(user.uid).set(
                  {
                    'userName': userNameTextEditingController,
                    'userEmail': user.email,
                  },
                );
              }
            },
          );
          try {
            await credential
                .signInWithEmailAndPassword(
              email: emailTextEditingController,
              password: passwordTextEditingController,
            )
                .then(
              (value) {
                print('로그인 성공');
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
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String emailTextEditingController,
      String passwordTextEditingController) async {
    try {
      credential
          .signInWithEmailAndPassword(
        email: emailTextEditingController,
        password: passwordTextEditingController,
      )
          .then(
        (value) {
          print('로그인 성공');
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
